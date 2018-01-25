<?php

class datasourceentry_anterior extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'entry-anterior';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:date';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:date' => '{system:date}',
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function allowEditorToParse()
    {
        return false;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = $this->executeLocal($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }

    private function executeLocal(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        if (!$section = SectionManager::fetch((int)$this->getSource())) {
            $about = $this->about();
            trigger_error(__('The Section, %s, associated with the Data source, %s, could not be found.', array($this->getSource(), '<code>' . $about['name'] . '</code>')), E_USER_ERROR);
        }

        $sectioninfo = new XMLElement('section', General::sanitize($section->get('name')), array(
            'id' => $section->get('id'),
            'handle' => $section->get('handle')
        ));
        $result->appendChild($sectioninfo);

        $entryid = $param_pool["ds-entries.system-id"][0];
        if (!$entryid) {
            trigger_error(__('invalid entry id', array($this->getSource(), '<code>' . "vecinos" . '</code>')), E_USER_ERROR);
        }

        $sqlFecha = "select creation_date from sym_entries where id=" . $entryid;
        if (!$resFecha = Symphony::Database()->fetch($sqlFecha)) {
            return "";
        }
        $fecha = $resFecha[0]["creation_date"];

        $this->obtenerAnterior($fecha, $result);
        $this->obtenerPosterior($fecha, $result);
        return $result;
    }

    public function getSource()
    {
        return '1';
    }

    public function about()
    {
        return array(
            'name' => 'Entry Anterior',
            'author' => array(
                'name' => 'Miguel Payet',
                'website' => 'http://cuerpotaxi',
                'email' => 'miguelpayet@gmail.com'),
            'version' => 'Symphony 2.7.0',
            'release-date' => '2018-01-24T01:48:06+00:00'
        );
    }

    private function obtenerAnterior($fecha, $result)
    {
        return $this->obtenerHandle($fecha, "max", "<", $result);
    }

    private function obtenerHandle($fecha, $funcion, $comparador, $result)
    {
        $sqlDate = "select " . $funcion . "(creation_date) as valor from sym_entries where creation_date" . $comparador . "'" . $fecha . "'";
        if (!$resDate = Symphony::Database()->fetch($sqlDate)) {
            return;
        }
        $fechaVecino = $resDate[0]["valor"];
        $sqlId = "select max(id) as valor from sym_entries where creation_date = '" . $fechaVecino . "'";
        if (!$resId = Symphony::Database()->fetch($sqlId)) {
            return;
        }
        $id = $resId[0]["valor"];
        if (!$id) {
            return;
        }
        $sqlHandle = "select d.handle as handle, d.value as titulo from sym_entries_data_1 d where entry_id=" . $id . ";";
        if (!$resHnd = Symphony::Database()->fetch($sqlHandle)) {
            return;
        }
        $vecinos = new XMLElement("vecino", null, array("posicion" => "anterior"));
        $vecinos->appendChild(new XMLElement("handle", $resHnd[0]["handle"], array()));
        $vecinos->appendChild(new XMLElement("titulo", $resHnd[0]["titulo"], array()));
        $result->appendChild($vecinos);
        return;
    }

    private function obtenerPosterior($fecha, $result)
    {
        return $this->obtenerHandle($fecha, "min", ">", $result);
    }

}