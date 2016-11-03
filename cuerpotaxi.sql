-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: futbolizame
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sym_authors`
--

DROP TABLE IF EXISTS `sym_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_authors`
--

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;
INSERT INTO `sym_authors` VALUES (1,'admin','PBKDF2v1|10000|cdb9e5571e92620a5eb6|ijWZ0ehPmQZG3vC0vWZTZbDZV/i+s3rfyLiJ0RZqbXDefmNnTwg28A==','Miguel','Payet','miguelpayet@gmail.com','2015-09-09 22:19:41','developer','yes',NULL,'no',NULL);
/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_cache`
--

DROP TABLE IF EXISTS `sym_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_cache`
--

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries`
--

DROP TABLE IF EXISTS `sym_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries`
--

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` VALUES (1,1,1,'2015-06-14 20:11:45','2015-06-15 01:11:45','2015-06-14 21:14:28','2015-06-15 02:14:28'),(2,1,1,'2015-06-14 20:16:21','2015-06-15 01:16:21','2015-06-14 22:31:48','2015-06-15 03:31:48'),(3,1,1,'2015-06-14 20:30:21','2015-06-15 01:30:21','2015-06-14 21:18:28','2015-06-15 02:18:28'),(4,1,1,'2015-06-14 20:51:46','2015-06-15 01:51:46','2015-06-14 22:42:06','2015-06-15 03:42:06'),(5,1,1,'2015-06-14 20:56:04','2015-06-15 01:56:04','2015-06-14 21:18:46','2015-06-15 02:18:46'),(6,1,1,'2015-06-14 21:13:49','2015-06-15 02:13:49','2015-06-18 22:40:35','2015-06-19 03:40:35'),(7,1,1,'2015-06-14 21:23:25','2015-06-15 02:23:25','2015-06-15 08:07:41','2015-06-15 13:07:41'),(8,1,1,'2015-06-15 08:07:50','2015-06-15 13:07:50','2015-06-17 00:01:23','2015-06-17 05:01:23'),(9,1,1,'2015-06-15 22:19:29','2015-06-16 03:19:29','2015-06-16 23:28:00','2015-06-17 04:28:00'),(10,1,1,'2015-06-17 00:01:00','2015-06-17 05:01:00','2015-09-09 21:30:14','2015-09-10 02:30:14'),(11,1,1,'2015-06-18 22:42:33','2015-06-19 03:42:33','2015-06-18 22:55:51','2015-06-19 03:55:51'),(12,1,1,'2015-09-09 21:29:18','2015-09-10 02:29:18','2015-09-09 22:19:41','2015-09-10 03:19:41');
/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_1`
--

DROP TABLE IF EXISTS `sym_entries_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_1`
--

LOCK TABLES `sym_entries_data_1` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_1` DISABLE KEYS */;
INSERT INTO `sym_entries_data_1` VALUES (15,1,'crear-el-quickstart','crear el quickstart'),(24,2,'anadir-dependencias','añadir dependencias'),(18,3,'eclipse','eclipse'),(26,4,'wicket-stuff','wicket-stuff'),(19,5,'run','run'),(41,6,'para-conectarlo-a-hibernate','para conectarlo a hibernate'),(29,7,'activar-wicket-bootstrap','activar wicket-bootstrap'),(38,8,'login','login'),(35,9,'crear-la-barra-de-navegacion','crear la barra de navegación'),(47,10,'un-realm-de-shiro-que-se-conecte-a-mi-propia-base-de-datos','un realm de shiro que se conecte a mi propia base de datos'),(44,11,'para-proteger-una-pagina-contra-acceso-no-autentificado','para proteger una página contra acceso no autentificado'),(48,12,'autentificacion','autentificación');
/*!40000 ALTER TABLE `sym_entries_data_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_2`
--

DROP TABLE IF EXISTS `sym_entries_data_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_2`
--

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;
INSERT INTO `sym_entries_data_2` VALUES (14,1,'así que aceptas hacer una aplicación para el estudio de un amigo tuyo.\r\neres un eterno optimista, así que decides hacerla en java (porque te gusta programar en java) y porque en 5 minutos encuentras un framework que se ve prometedor. wicket.\r\nasí que, sabiendo casi nada de java, cero de wicket, y nunca habiendo hecho una aplicación web, te comprometes con tu amigo a entregar en un plazo determinado (que no voy a mencionar aquí porque no creo que lo cumpla).\r\nesta es tu historia.\r\n\r\nel primer día decides usar eclipse y no intellij porque estás acostumbrado a eclipse y porque no quieres piratear intellij (y es demasiado caro para algo que estás haciendo ad-honorem).\r\nademás eclipse para java ee ya está instalado en tu máquina.\r\n\r\nestos son los pasos que sigues el primer día:\r\n\r\n1. crear el arquetipo de wicket quickstart para la versión 7.0.0-M5 (porque te gustan las últimas versiones y francamente esperas que esa versión sea release para cuando termines). \r\n\r\nel link de como crear el arquetipo es este: https://wicket.apache.org/start/quickstart.html . en resumen se trata de ejecutar este comando en tu directorio de proyectos:\r\n\r\n    mvn archetype:generate -DarchetypeGroupId=org.apache.wicket -DarchetypeArtifactId=wicket-archetype-quickstart -DarchetypeVersion=7.0.0-M5 -   DgroupId=test -DartifactId=test -DarchetypeRepository=https://repository.apache.org/ -DinteractiveMode=false\r\n\r\nde allí lo importas a eclipse.\r\n\r\nte salen unos errores en el pom.xml que, cuando los buscas en stackoverflow (y demos gracias por stackoverflow) encuentras una solución que te funciona: http://stackoverflow.com/questions/20218486/unable-to-build-using-maven-with-error-failed-to-execute-goal-org-apache-maven. la solución que funciona es la que tiene 50 puntos a la hora de escribir esto. traté de darle un punto más pero me pidió hacer login con algo y que flojera decidir si usar mi propio nombre o uno de mis sock puppets.\r\n\r\nde allí sale un warning de que tu java execution environment es el jdk 1.8 (que es el único que tienes instalado) pero que proyecto está configurado para 1.7. es fácil de arreglar siguiendo los quick fixes de eclipse. básicamente se trata de configurar las variables del proyecto para que sea nivel 1.8 de código y que use tu jdk y tu system library.\r\n\r\nde allí queda un warning sobre el log4j2.xml que no tiene DTD. ese lo ignoraremos.','<p>así que aceptas hacer una aplicación para el estudio de un amigo tuyo.\neres un eterno optimista, así que decides hacerla en java (porque te gusta programar en java) y porque en 5 minutos encuentras un framework que se ve prometedor. wicket.\nasí que, sabiendo casi nada de java, cero de wicket, y nunca habiendo hecho una aplicación web, te comprometes con tu amigo a entregar en un plazo determinado (que no voy a mencionar aquí porque no creo que lo cumpla).\nesta es tu historia.</p>\n\n<p>el primer día decides usar eclipse y no intellij porque estás acostumbrado a eclipse y porque no quieres piratear intellij (y es demasiado caro para algo que estás haciendo ad-honorem).\nademás eclipse para java ee ya está instalado en tu máquina.</p>\n\n<p>estos son los pasos que sigues el primer día:</p>\n\n<ol>\n<li>crear el arquetipo de wicket quickstart para la versión 7.0.0-M5 (porque te gustan las últimas versiones y francamente esperas que esa versión sea release para cuando termines). </li>\n</ol>\n\n<p>el link de como crear el arquetipo es este: https://wicket.apache.org/start/quickstart.html . en resumen se trata de ejecutar este comando en tu directorio de proyectos:</p>\n\n<pre><code>mvn archetype:generate -DarchetypeGroupId=org.apache.wicket -DarchetypeArtifactId=wicket-archetype-quickstart -DarchetypeVersion=7.0.0-M5 -   DgroupId=test -DartifactId=test -DarchetypeRepository=https://repository.apache.org/ -DinteractiveMode=false\n</code></pre>\n\n<p>de allí lo importas a eclipse.</p>\n\n<p>te salen unos errores en el pom.xml que, cuando los buscas en stackoverflow (y demos gracias por stackoverflow) encuentras una solución que te funciona: http://stackoverflow.com/questions/20218486/unable-to-build-using-maven-with-error-failed-to-execute-goal-org-apache-maven. la solución que funciona es la que tiene 50 puntos a la hora de escribir esto. traté de darle un punto más pero me pidió hacer login con algo y que flojera decidir si usar mi propio nombre o uno de mis sock puppets.</p>\n\n<p>de allí sale un warning de que tu java execution environment es el jdk 1.8 (que es el único que tienes instalado) pero que proyecto está configurado para 1.7. es fácil de arreglar siguiendo los quick fixes de eclipse. básicamente se trata de configurar las variables del proyecto para que sea nivel 1.8 de código y que use tu jdk y tu system library.</p>\n\n<p>de allí queda un warning sobre el log4j2.xml que no tiene DTD. ese lo ignoraremos.</p>\n'),(17,3,'es una excelente idea ir a las preferencias de eclipse y en la pestaña de maven chequear estas tres cosas:\r\n\r\n* download artifact sources\r\n* download artifact javadoc\r\n* update maven projects on startup\r\n','<p>es una excelente idea ir a las preferencias de eclipse y en la pestaña de maven chequear estas tres cosas:</p>\n\n<ul>\n<li>download artifact sources</li>\n<li>download artifact javadoc</li>\n<li>update maven projects on startup</li>\n</ul>\n'),(23,2,'ahora toca añadir las dependencias al proyecto de los componentes que pensamos usar.\r\n\r\nprimero está hibernate. damos gracias por maven y añadimos esto en el pom.xml:\r\n\r\nen la sección de properties va esto:\r\n\r\n    <hibernate.version>4.3.8.Final</hibernate.version>\r\n   \r\nen la sección de dependencies va esto: \r\n\r\n    <!-- Hibernate -->\r\n    <dependency>\r\n    <groupId>org.hibernate</groupId>\r\n    <artifactId>hibernate-core</artifactId>\r\n    <version>${hibernate.version}</version>\r\n    </dependency>\r\n    <dependency>\r\n    <groupId>mysql</groupId>\r\n    <artifactId>mysql-connector-java</artifactId>\r\n    <version>5.1.6</version>\r\n    </dependency>\r\n\r\ntambién le quitamos la configuración de opcional a wicket-extensions.\r\n\r\ndespués añadimos la dependencia de shiro, porque pensamos hacer nuestra propia seguridad (por si el proyecto no fuera suficientemente complicado).\r\n\r\nprimero va en la sección de properties esto:\r\n\r\n    <shiro.version>1.2.3</shiro.version>\r\n        \r\ndespués en la sección de dependencias:\r\n\r\n    <!-- Shiro -->\r\n    <dependency>\r\n    <groupId>org.apache.shiro</groupId>\r\n    <artifactId>shiro-core</artifactId>\r\n    <version>${shiro.version}</version>\r\n    </dependency>\r\n    <dependency>\r\n    <groupId>org.apache.shiro</groupId>\r\n    <artifactId>shiro-web</artifactId>\r\n    <version>${shiro.version}</version>\r\n    </dependency>\r\n    <dependency>\r\n    <groupId>org.slf4j</groupId>\r\n    <artifactId>jcl-over-slf4j</artifactId>\r\n    <version>1.7.10</version>\r\n    </dependency>\r\n\r\ndespués wicket-bootstrap:\r\n\r\n    <!-- wicket-bootstrap-->\r\n    <dependency>\r\n    <groupId>de.agilecoders.wicket</groupId>\r\n    <artifactId>wicket-bootstrap-core</artifactId>\r\n    <version>0.10.1</version>\r\n    </dependency>\r\n    <dependency>\r\n    <groupId>de.agilecoders.wicket</groupId>\r\n    <artifactId>wicket-bootstrap-extensions</artifactId>\r\n    <version>0.10.1</version>\r\n    </dependency>\r\n\r\nme falta añadir wicket-stuff que es imprescindible. vamos a hacer eso.','<p>ahora toca añadir las dependencias al proyecto de los componentes que pensamos usar.</p>\n\n<p>primero está hibernate. damos gracias por maven y añadimos esto en el pom.xml:</p>\n\n<p>en la sección de properties va esto:</p>\n\n<pre><code>&lt;hibernate.version&gt;4.3.8.Final&lt;/hibernate.version&gt;\n</code></pre>\n\n<p>en la sección de dependencies va esto: </p>\n\n<pre><code>&lt;!-- Hibernate --&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;org.hibernate&lt;/groupId&gt;\n&lt;artifactId&gt;hibernate-core&lt;/artifactId&gt;\n&lt;version&gt;${hibernate.version}&lt;/version&gt;\n&lt;/dependency&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;mysql&lt;/groupId&gt;\n&lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;\n&lt;version&gt;5.1.6&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n\n<p>también le quitamos la configuración de opcional a wicket-extensions.</p>\n\n<p>después añadimos la dependencia de shiro, porque pensamos hacer nuestra propia seguridad (por si el proyecto no fuera suficientemente complicado).</p>\n\n<p>primero va en la sección de properties esto:</p>\n\n<pre><code>&lt;shiro.version&gt;1.2.3&lt;/shiro.version&gt;\n</code></pre>\n\n<p>después en la sección de dependencias:</p>\n\n<pre><code>&lt;!-- Shiro --&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;\n&lt;artifactId&gt;shiro-core&lt;/artifactId&gt;\n&lt;version&gt;${shiro.version}&lt;/version&gt;\n&lt;/dependency&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;\n&lt;artifactId&gt;shiro-web&lt;/artifactId&gt;\n&lt;version&gt;${shiro.version}&lt;/version&gt;\n&lt;/dependency&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;org.slf4j&lt;/groupId&gt;\n&lt;artifactId&gt;jcl-over-slf4j&lt;/artifactId&gt;\n&lt;version&gt;1.7.10&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n\n<p>después wicket-bootstrap:</p>\n\n<pre><code>&lt;!-- wicket-bootstrap--&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;de.agilecoders.wicket&lt;/groupId&gt;\n&lt;artifactId&gt;wicket-bootstrap-core&lt;/artifactId&gt;\n&lt;version&gt;0.10.1&lt;/version&gt;\n&lt;/dependency&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;de.agilecoders.wicket&lt;/groupId&gt;\n&lt;artifactId&gt;wicket-bootstrap-extensions&lt;/artifactId&gt;\n&lt;version&gt;0.10.1&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n\n<p>me falta añadir wicket-stuff que es imprescindible. vamos a hacer eso.</p>\n'),(25,4,'esto de wicket-stuff no se ve tan simple de entrada, no me queda claro si se agrega todo con una sola dependencia o que. \r\n\r\nsoy de los que no leen mucho la documentación. una mirada rápida para ver los comandos o lo que sea que quiero copiar y pegar y listo. esto me hace perder un montón de tiempo.\r\n\r\nparece que primero hay que añadir un repositorio especial al pom.xml:\r\n\r\n    <repository>\r\n    <id>wicketstuff-core-snapshots</id>\r\n    <url>https://oss.sonatype.org/content/repositories/snapshots</url>\r\n    <snapshots>\r\n    <enabled>true</enabled>\r\n    </snapshots>        \r\n    </repository>\r\n\r\nvamos a empezar con el plugin de datatables que es el primero que voy a necesitar. la explicación está allí mismo en el readme. es lo primero que dice.\r\n\r\ndice que hay que añadir la dependencia del proyecto que quieres usar:\r\n\r\n    <dependency>\r\n    <groupId>org.wicketstuff</groupId>\r\n    <artifactId>phonebook</artifactId>\r\n    <version>1.4.19</version>\r\n    </dependency>\r\n\r\nahora me falta averiguar cual es el nombre y versión de datatables. lo busco en http://mvnrepository.com/artifact/org.wicketstuff/wicketstuff-datatables. \r\n\r\n    <dependency>\r\n    <groupId>org.wicketstuff</groupId>\r\n    <artifactId>wicketstuff-datatables</artifactId>\r\n    <version>${wicket.version}</version>\r\n    </dependency>\r\n','<p>esto de wicket-stuff no se ve tan simple de entrada, no me queda claro si se agrega todo con una sola dependencia o que. </p>\n\n<p>soy de los que no leen mucho la documentación. una mirada rápida para ver los comandos o lo que sea que quiero copiar y pegar y listo. esto me hace perder un montón de tiempo.</p>\n\n<p>parece que primero hay que añadir un repositorio especial al pom.xml:</p>\n\n<pre><code>&lt;repository&gt;\n&lt;id&gt;wicketstuff-core-snapshots&lt;/id&gt;\n&lt;url&gt;https://oss.sonatype.org/content/repositories/snapshots&lt;/url&gt;\n&lt;snapshots&gt;\n&lt;enabled&gt;true&lt;/enabled&gt;\n&lt;/snapshots&gt;        \n&lt;/repository&gt;\n</code></pre>\n\n<p>vamos a empezar con el plugin de datatables que es el primero que voy a necesitar. la explicación está allí mismo en el readme. es lo primero que dice.</p>\n\n<p>dice que hay que añadir la dependencia del proyecto que quieres usar:</p>\n\n<pre><code>&lt;dependency&gt;\n&lt;groupId&gt;org.wicketstuff&lt;/groupId&gt;\n&lt;artifactId&gt;phonebook&lt;/artifactId&gt;\n&lt;version&gt;1.4.19&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n\n<p>ahora me falta averiguar cual es el nombre y versión de datatables. lo busco en http://mvnrepository.com/artifact/org.wicketstuff/wicketstuff-datatables. </p>\n\n<pre><code>&lt;dependency&gt;\n&lt;groupId&gt;org.wicketstuff&lt;/groupId&gt;\n&lt;artifactId&gt;wicketstuff-datatables&lt;/artifactId&gt;\n&lt;version&gt;${wicket.version}&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n'),(18,5,'ya tengo todo listo para comenzar a programar. pero primero voy a correr el quickstart a ver que pasa.\r\n\r\ncrear una run configuration (yo uso debug configuration porque siempre espero que algo falle, pero eso es algo mío) de tipo application y elegir la clase start dentro de tu aplicación (según el grupo que le pusiste al crear el arquetipo).\r\n\r\nde allí le das play (o debug).\r\n\r\nde allí navegas a http://localhost:8080\r\n\r\ny si todo está bien te sale una página de inicio de wicket. listo. ya está el punto de partida.','<p>ya tengo todo listo para comenzar a programar. pero primero voy a correr el quickstart a ver que pasa.</p>\n\n<p>crear una run configuration (yo uso debug configuration porque siempre espero que algo falle, pero eso es algo mío) de tipo application y elegir la clase start dentro de tu aplicación (según el grupo que le pusiste al crear el arquetipo).</p>\n\n<p>de allí le das play (o debug).</p>\n\n<p>de allí navegas a http://localhost:8080</p>\n\n<p>y si todo está bien te sale una página de inicio de wicket. listo. ya está el punto de partida.</p>\n'),(28,7,'lo primero sería activar el wicket-bootstrap. las instrucciones para hacer eso están en: https://github.com/l0rdn1kk0n/wicket-bootstrap/\r\n\r\nde lo que se trata es de poner este código en la clase de aplicación, que en el quickstart se llama WicketApplication. en el método init se añade:\r\n\r\n    Bootstrap.install(this);\r\n\r\ncuando haces esto y corres el aplicativo, no notas ninguna diferencia en la página (obviamente) pero si miras el código fuente de la página ves que ha aparecido el css y el javascript de bootstrap. así que todo bien.\r\n ','<p>lo primero sería activar el wicket-bootstrap. las instrucciones para hacer eso están en: https://github.com/l0rdn1kk0n/wicket-bootstrap/</p>\n\n<p>de lo que se trata es de poner este código en la clase de aplicación, que en el quickstart se llama WicketApplication. en el método init se añade:</p>\n\n<pre><code>Bootstrap.install(this);\n</code></pre>\n\n<p>cuando haces esto y corres el aplicativo, no notas ninguna diferencia en la página (obviamente) pero si miras el código fuente de la página ves que ha aparecido el css y el javascript de bootstrap. así que todo bien.</p>\n'),(34,9,'lo primero que voy a hacer es modificar la página de inicio del quickstart para que tenga una barra superior con el nombre de la aplicación.\r\n\r\nla primera versión de la barra de navegación va a tener el nombre del proyecto a la izquierda y nada más. luego le pondré el nombre del usuario a la derecha para que sirva como menú para logout y cambio de password.\r\n\r\npara esto he decidido crear un panel de wicket que pueda reusar luego en todas las páginas o en una página maestra o lo que sea.\r\n\r\npor si acaso, en wicket tienes dos archivos para cada componente de interfaz, uno con el markup en html y otro con la lógica en java. los dos tienen que estar juntitos en la misma carpeta para que todo fluya. \r\n\r\npara crear un panel hay dos pasos:\r\n\r\n1. crear el archivo html con el layout para el panel. aquí está el mío (es realmente básico)\r\n\r\n<![CDATA[\r\n     <html>\r\n        <body>\r\n            <wicket:panel>\r\n    		   <div wicket:id=\"wicket-markup-id\"></div>\r\n    	    </wicket:panel>\r\n        </body>\r\n    </html>\r\n]]>\r\n\r\n2. crear una clase java para la lógica del panel. aquí está el mío. nuevamente, realmente básico.\r\n\r\n    import org.apache.wicket.markup.html.panel.Panel;\r\n    import org.apache.wicket.model.Model;\r\n    import de.agilecoders.wicket.core.markup.html.bootstrap.navbar.Navbar;\r\n    public class HeaderPanel extends Panel {\r\n    private static final long serialVersionUID = 1L;\r\n    public HeaderPanel(String id) {\r\n        super(id);\r\n        Navbar navbar = new Navbar(\"wicket-markup-id\");\r\n        navbar.fluid();\r\n        navbar.setBrandName(Model.of(\"Project name\"));\r\n            add(navbar);\r\n        }\r\n    }\r\n\r\nel ejemplo lo copié de la documentación de wicket-bootstrap de aquí: https://github.com/l0rdn1kk0n/wicket-bootstrap/wiki/Navbar.\r\n\r\ndespués para usar el panel en alguna página se hace esto. por ejemplo, he modificado el start page de mi aplicación.\r\n\r\neste es el html del start page:\r\n\r\n    <!DOCTYPE html>\r\n    <html xmlns:wicket=\"http://wicket.apache.org\">\r\n    <head>\r\n        <meta charset=\"utf-8\" />\r\n        <title>Hoja de Tiempo</title>\r\n        <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" media=\"screen\" title=\"Stylesheet\" />\r\n    </head>\r\n    <body>\r\n        <div wicket:id=\"panel\">this gets replaced</div>\r\n    </body>\r\n    </html>\r\n\r\ny esta es la clase HomePage.java\r\n\r\n    import org.apache.wicket.markup.html.WebPage;\r\n    import org.apache.wicket.markup.html.basic.Label;\r\n    import org.apache.wicket.request.mapper.parameter.PageParameters;\r\n    import pe.da.ui.HeaderPanel;\r\n    public class HomePage extends WebPage {\r\n        private static final long serialVersionUID = 1L;\r\n        public HomePage(final PageParameters parameters) {\r\n            super(parameters);\r\n            add(new HeaderPanel(\"panel\"));\r\n        }\r\n    }','<p>lo primero que voy a hacer es modificar la página de inicio del quickstart para que tenga una barra superior con el nombre de la aplicación.</p>\n\n<p>la primera versión de la barra de navegación va a tener el nombre del proyecto a la izquierda y nada más. luego le pondré el nombre del usuario a la derecha para que sirva como menú para logout y cambio de password.</p>\n\n<p>para esto he decidido crear un panel de wicket que pueda reusar luego en todas las páginas o en una página maestra o lo que sea.</p>\n\n<p>por si acaso, en wicket tienes dos archivos para cada componente de interfaz, uno con el markup en html y otro con la lógica en java. los dos tienen que estar juntitos en la misma carpeta para que todo fluya. </p>\n\n<p>para crear un panel hay dos pasos:</p>\n\n<ol>\n<li>crear el archivo html con el layout para el panel. aquí está el mío (es realmente básico)</li>\n</ol>\n\n<p><![CDATA[\n     <html>\n        <body>\n            <wicket:panel>\n               <div wicket:id=\"wicket-markup-id\"></div>\n            </wicket:panel>\n        </body>\n    </html>\n]]></p>\n\n<ol>\n<li><p>crear una clase java para la lógica del panel. aquí está el mío. nuevamente, realmente básico.</p>\n\n<p>import org.apache.wicket.markup.html.panel.Panel;\nimport org.apache.wicket.model.Model;\nimport de.agilecoders.wicket.core.markup.html.bootstrap.navbar.Navbar;\npublic class HeaderPanel extends Panel {\nprivate static final long serialVersionUID = 1L;\npublic HeaderPanel(String id) {\n    super(id);\n    Navbar navbar = new Navbar(\"wicket-markup-id\");\n    navbar.fluid();\n    navbar.setBrandName(Model.of(\"Project name\"));\n        add(navbar);\n    }\n}</p></li>\n</ol>\n\n<p>el ejemplo lo copié de la documentación de wicket-bootstrap de aquí: https://github.com/l0rdn1kk0n/wicket-bootstrap/wiki/Navbar.</p>\n\n<p>después para usar el panel en alguna página se hace esto. por ejemplo, he modificado el start page de mi aplicación.</p>\n\n<p>este es el html del start page:</p>\n\n<pre><code><!DOCTYPE html>\n<html xmlns:wicket=\"http://wicket.apache.org\">\n<head>\n    <meta charset=\"utf-8\" />\n    <title>Hoja de Tiempo</title>\n    <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" media=\"screen\" title=\"Stylesheet\" />\n</head>\n<body>\n    <div wicket:id=\"panel\">this gets replaced</div>\n</body>\n</html>\n</code></pre>\n\n<p>y esta es la clase HomePage.java</p>\n\n<pre><code>import org.apache.wicket.markup.html.WebPage;\nimport org.apache.wicket.markup.html.basic.Label;\nimport org.apache.wicket.request.mapper.parameter.PageParameters;\nimport pe.da.ui.HeaderPanel;\npublic class HomePage extends WebPage {\n    private static final long serialVersionUID = 1L;\n    public HomePage(final PageParameters parameters) {\n        super(parameters);\n        add(new HeaderPanel(\"panel\"));\n    }\n}\n</code></pre>'),(37,8,'mi primera tarea es construir un módulo básico de seguridad sobre apache shiro.\r\n\r\ncuatro objetivos para el módulo: \r\n\r\n* poder hacer login y logout. \r\n* poder tener un rol por usuario. \r\n* permitir que el usuario cambie su password.\r\n* tener un panel de altas, bajas, cambios de usuarios para el admin.\r\n\r\ndespués viene:\r\n\r\n* un form para login\r\n* el nombre del usuario a la derecha de la barra superior, con links para logout y de cambio de password. \r\n\r\nla cuestión aquí es más complicada porque hay que crear varias cosas:\r\n\r\n1. un realm de shiro que se conecte a mi propia base de datos (a través de mi modelo de hibernate)\r\n2. un filtro en wicket o en jetty para que evalué cada secuencia de request / response y vea si está autentificado, y si no lo está, lo envíe a la página de login. esto implementa un pattern que no me acuerdo como se llama ... es posible que sea session por request o algo así.\r\n3. implementar la página de login\r\n4. implementar una lógica que arme el menú según el rol del usuario\r\n\r\nvamos una por una.','<p>mi primera tarea es construir un módulo básico de seguridad sobre apache shiro.</p>\n\n<p>cuatro objetivos para el módulo: </p>\n\n<ul>\n<li>poder hacer login y logout. </li>\n<li>poder tener un rol por usuario. </li>\n<li>permitir que el usuario cambie su password.\n* tener un panel de altas, bajas, cambios de usuarios para el admin.</li>\n</ul>\n\n<p>después viene:</p>\n\n<ul>\n<li>un form para login</li>\n<li>el nombre del usuario a la derecha de la barra superior, con links para logout y de cambio de password. </li>\n</ul>\n\n<p>la cuestión aquí es más complicada porque hay que crear varias cosas:</p>\n\n<ol>\n<li>un realm de shiro que se conecte a mi propia base de datos (a través de mi modelo de hibernate)</li>\n<li>un filtro en wicket o en jetty para que evalué cada secuencia de request / response y vea si está autentificado, y si no lo está, lo envíe a la página de login. esto implementa un pattern que no me acuerdo como se llama ... es posible que sea session por request o algo así.</li>\n<li>implementar la página de login</li>\n<li>implementar una lógica que arme el menú según el rol del usuario</li>\n</ol>\n\n<p>vamos una por una.</p>\n'),(40,6,'para conectarlo a hibernate hay que crear un archivo hibernate.cfg.xml en la carpeta /src/main/webapp/WEB-INF/classes/ del proyecto.\r\n\r\neste es el contenido del mío (borrando passwords y eso)\r\n\r\n    <?xml version=\'1.0\' encoding=\'utf-8\'?>\r\n    <!DOCTYPE hibernate-configuration PUBLIC\r\n        \"-//Hibernate/Hibernate Configuration DTD 3.0//EN\"\r\n        \"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd\">\r\n\r\n    <hibernate-configuration>\r\n    <session-factory>\r\n    <property name=\"connection.driver_class\">com.mysql.jdbc.Driver</property>\r\n    <property name=\"connection.url\">jdbc:mysql://localhost:3306/mydb</property>\r\n    <property name=\"connection.username\">username</property>\r\n    <property name=\"connection.password\">password</property>\r\n    <property name=\"connection.pool_size\">1</property>\r\n    <property name=\"dialect\">org.hibernate.dialect.MySQLDialect</property>\r\n    <property name=\"current_session_context_class\">thread</property>\r\n    <property name=\"cache.provider_class\">org.hibernate.cache.internal.NoCacheProvider</property>\r\n    <property name=\"show_sql\">true</property>\r\n    </session-factory>\r\n    </hibernate-configuration>\r\n\r\ndespués para activar hibernate:\r\n1. hay que crear una clase que inicialize a hibernate, la típica se llama HibernateUtil y tiene un método getSessionFactory que hace la inicialización. \r\n\r\n    public static SessionFactory getSessionFactory() {\r\n        if (sessionFactory == null) {\r\n            configuration = new Configuration();\r\n            configuration.addAnnotatedClass(Usuario.class);\r\n            configuration.addAnnotatedClass(Rol.class);\r\n            configuration.configure();\r\n            serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();\r\n            sessionFactory = configuration.buildSessionFactory(serviceRegistry);\r\n        }\r\n        return sessionFactory;\r\n    }\r\n\r\n2. hay que invocar a este getSessionFactory para crear una nueva sesión cada vez que querramos una (en el session per request pattern es una vez por request) (eso está un poco más adelante).\r\n\r\n\r\n','<p>para conectarlo a hibernate hay que crear un archivo hibernate.cfg.xml en la carpeta /src/main/webapp/WEB-INF/classes/ del proyecto.</p>\n\n<p>este es el contenido del mío (borrando passwords y eso)</p>\n\n<pre><code>&lt;?xml version=\'1.0\' encoding=\'utf-8\'?&gt;\n&lt;!DOCTYPE hibernate-configuration PUBLIC\n    \"-//Hibernate/Hibernate Configuration DTD 3.0//EN\"\n    \"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd\"&gt;\n\n&lt;hibernate-configuration&gt;\n&lt;session-factory&gt;\n&lt;property name=\"connection.driver_class\"&gt;com.mysql.jdbc.Driver&lt;/property&gt;\n&lt;property name=\"connection.url\"&gt;jdbc:mysql://localhost:3306/mydb&lt;/property&gt;\n&lt;property name=\"connection.username\"&gt;username&lt;/property&gt;\n&lt;property name=\"connection.password\"&gt;password&lt;/property&gt;\n&lt;property name=\"connection.pool_size\"&gt;1&lt;/property&gt;\n&lt;property name=\"dialect\"&gt;org.hibernate.dialect.MySQLDialect&lt;/property&gt;\n&lt;property name=\"current_session_context_class\"&gt;thread&lt;/property&gt;\n&lt;property name=\"cache.provider_class\"&gt;org.hibernate.cache.internal.NoCacheProvider&lt;/property&gt;\n&lt;property name=\"show_sql\"&gt;true&lt;/property&gt;\n&lt;/session-factory&gt;\n&lt;/hibernate-configuration&gt;\n</code></pre>\n\n<p>después para activar hibernate:\n1. hay que crear una clase que inicialize a hibernate, la típica se llama HibernateUtil y tiene un método getSessionFactory que hace la inicialización. </p>\n\n<pre><code>public static SessionFactory getSessionFactory() {\n    if (sessionFactory == null) {\n        configuration = new Configuration();\n        configuration.addAnnotatedClass(Usuario.class);\n        configuration.addAnnotatedClass(Rol.class);\n        configuration.configure();\n        serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();\n        sessionFactory = configuration.buildSessionFactory(serviceRegistry);\n    }\n    return sessionFactory;\n}\n</code></pre>\n\n<ol>\n<li>hay que invocar a este getSessionFactory para crear una nueva sesión cada vez que querramos una (en el session per request pattern es una vez por request) (eso está un poco más adelante).</li>\n</ol>\n'),(43,11,'lo que estoy usando es wicket auth-roles. las instrucciones de uso están aquí:\r\n\r\nhttps://wicket.apache.org/learn/projects/authroles.html\r\n\r\nse añade esta dependencia al pom.xml:\r\n\r\n    <!-- auth-roles -->\r\n    <dependency>\r\n    <groupId>org.apache.wicket</groupId>\r\n    <artifactId>wicket-auth-roles</artifactId>\r\n    <version>${wicket.version}</version>\r\n    </dependency>\r\n\r\nen el método init de mi clase aplicación he añadido una estrategia de autorización por roles:\r\n\r\n    getSecuritySettings().setAuthorizationStrategy(new RoleAuthorizationStrategy(new MiRoleCheckingStrategy()));\r\n\r\nesta es una clase super sencilla\r\n\r\npublic class MiRoleCheckingStrategy implements IRoleCheckingStrategy {\r\n\r\n	public boolean hasAnyRole(Roles arg0) {\r\n                Subject s = SecurityUtils.getSubject();\r\n                for (String r : arg0) {\r\n                if (s.hasRole(r)) {\r\n                    return true;\r\n                }\r\n            }\r\n            return false;\r\n        }\r\n    }\r\n\r\npara proteger una página contra acceso no autentificado lo que hay que hacer es añadir una anotación en la clase de la página. la anotación es @AuthorizeInstantiation y está definida en el wicket auth-roles, ','<p>lo que estoy usando es wicket auth-roles. las instrucciones de uso están aquí:</p>\n\n<p>https://wicket.apache.org/learn/projects/authroles.html</p>\n\n<p>se añade esta dependencia al pom.xml:</p>\n\n<pre><code>&lt;!-- auth-roles --&gt;\n&lt;dependency&gt;\n&lt;groupId&gt;org.apache.wicket&lt;/groupId&gt;\n&lt;artifactId&gt;wicket-auth-roles&lt;/artifactId&gt;\n&lt;version&gt;${wicket.version}&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n\n<p>en el método init de mi clase aplicación he añadido una estrategia de autorización por roles:</p>\n\n<pre><code>getSecuritySettings().setAuthorizationStrategy(new RoleAuthorizationStrategy(new MiRoleCheckingStrategy()));\n</code></pre>\n\n<p>esta es una clase super sencilla</p>\n\n<p>public class MiRoleCheckingStrategy implements IRoleCheckingStrategy {</p>\n\n<pre><code>public boolean hasAnyRole(Roles arg0) {\n            Subject s = SecurityUtils.getSubject();\n            for (String r : arg0) {\n            if (s.hasRole(r)) {\n                return true;\n            }\n        }\n        return false;\n    }\n}\n</code></pre>\n\n<p>para proteger una página contra acceso no autentificado lo que hay que hacer es añadir una anotación en la clase de la página. la anotación es @AuthorizeInstantiation y está definida en el wicket auth-roles, </p>\n'),(47,12,'una vez que termino con la configuración del web.xml y el pom.xml, empiezo por crear:\r\n\r\nuna clase que se llame MiWebSession y que tenga métodos para autentificar, para ver si está autentificado y para obtener el usuario actual\r\n\r\nregistrar la clase de sesion en la clase application método newSession\r\n\r\nañadir una clase con la estrategia de autenticacion y configurarla en la clase application','<p>una vez que termino con la configuración del web.xml y el pom.xml, empiezo por crear:</p>\n\n<p>una clase que se llame MiWebSession y que tenga métodos para autentificar, para ver si está autentificado y para obtener el usuario actual</p>\n\n<p>registrar la clase de sesion en la clase application método newSession</p>\n\n<p>añadir una clase con la estrategia de autenticacion y configurarla en la clase application</p>\n'),(46,10,'primero tengo que implementar mi modelo de dominio. voy a crear solamente dos cosas mínimas: un usuario y un rol. le voy a poner las anotaciones de hibernate para que los pueda conectar a la base de datos\r\n\r\ndespués hay que crear los data access objects.\r\n\r\ndespués hay que crear el realm.\r\n\r\ndespués hay que configurar shiro.\r\n\r\ndespués hay que poner el filtro de shiro (uno de caja) en el web.xml de la aplicación.\r\n','<p>primero tengo que implementar mi modelo de dominio. voy a crear solamente dos cosas mínimas: un usuario y un rol. le voy a poner las anotaciones de hibernate para que los pueda conectar a la base de datos</p>\n\n<p>después hay que crear los data access objects.</p>\n\n<p>después hay que crear el realm.</p>\n\n<p>después hay que configurar shiro.</p>\n\n<p>después hay que poner el filtro de shiro (uno de caja) en el web.xml de la aplicación.</p>\n');
/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_3`
--

DROP TABLE IF EXISTS `sym_entries_data_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  `field_` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`,`field_`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_3`
--

LOCK TABLES `sym_entries_data_3` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_3` DISABLE KEYS */;
INSERT INTO `sym_entries_data_3` VALUES (7,1,1,NULL),(15,2,2,NULL),(10,3,4,NULL),(17,4,3,NULL),(31,6,6,NULL),(11,5,5,NULL),(20,7,7,NULL),(28,8,9,NULL),(25,9,8,NULL),(36,10,10,NULL),(34,11,11,NULL),(38,12,12,NULL);
/*!40000 ALTER TABLE `sym_entries_data_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions`
--

DROP TABLE IF EXISTS `sym_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions`
--

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` VALUES (1,'debugdevkit','enabled','1.3.3'),(2,'export_ensemble','enabled','2.1.2'),(3,'jit_image_manipulation','enabled','1.41'),(4,'maintenance_mode','enabled','1.8.3'),(5,'markdown','enabled','1.21'),(6,'profiledevkit','enabled','1.5.2'),(7,'selectbox_link_field','enabled','1.33'),(8,'xssfilter','enabled','1.4.1'),(9,'order_entries','enabled','2.2.1');
/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions_delegates`
--

DROP TABLE IF EXISTS `sym_extensions_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions_delegates`
--

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;
INSERT INTO `sym_extensions_delegates` VALUES (1,1,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(2,1,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(3,2,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(4,3,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(5,3,'/system/preferences/','Save','__SavePreferences'),(6,4,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(7,4,'/system/preferences/','Save','__SavePreferences'),(8,4,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),(9,4,'/backend/','AppendPageAlert','__appendAlert'),(10,4,'/blueprints/pages/','AppendPageContent','__appendType'),(11,4,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),(12,4,'/frontend/','FrontendParamsResolve','__addParam'),(13,6,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(14,6,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(15,8,'/blueprints/events/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),(16,8,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),(17,8,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),(18,8,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),(19,8,'/frontend/','FrontendParamsResolve','frontendParamsResolve'),(20,9,'/backend/','InitaliseAdminPageHead','prepareIndex'),(21,9,'/backend/','AdminPagePreGenerate','adjustTable'),(22,9,'/backend/','AdminPagePostGenerate','resetPagination'),(23,9,'/frontend/','DataSourcePreExecute','saveFilterContext');
/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields`
--

DROP TABLE IF EXISTS `sym_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields`
--

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` VALUES (1,'titulo','titulo','input',1,'yes',0,'main','yes'),(2,'texto','texto','textarea',1,'yes',1,'main','no'),(3,'Orden','orden','order_entries',1,'no',2,'sidebar','yes');
/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_author`
--

DROP TABLE IF EXISTS `sym_fields_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_author`
--

LOCK TABLES `sym_fields_author` WRITE;
/*!40000 ALTER TABLE `sym_fields_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_checkbox`
--

DROP TABLE IF EXISTS `sym_fields_checkbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_checkbox`
--

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_date`
--

DROP TABLE IF EXISTS `sym_fields_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_date`
--

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_input`
--

DROP TABLE IF EXISTS `sym_fields_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_input`
--

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` VALUES (2,1,NULL);
/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_order_entries`
--

DROP TABLE IF EXISTS `sym_fields_order_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `disable_pagination` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `filtered_fields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_order_entries`
--

LOCK TABLES `sym_fields_order_entries` WRITE;
/*!40000 ALTER TABLE `sym_fields_order_entries` DISABLE KEYS */;
INSERT INTO `sym_fields_order_entries` VALUES (1,3,'yes','yes',NULL,NULL);
/*!40000 ALTER TABLE `sym_fields_order_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_select`
--

DROP TABLE IF EXISTS `sym_fields_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_select`
--

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_selectbox_link`
--

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_selectbox_link`
--

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_taglist`
--

DROP TABLE IF EXISTS `sym_fields_taglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_taglist`
--

LOCK TABLES `sym_fields_taglist` WRITE;
/*!40000 ALTER TABLE `sym_fields_taglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_taglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_textarea`
--

DROP TABLE IF EXISTS `sym_fields_textarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_textarea`
--

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;
INSERT INTO `sym_fields_textarea` VALUES (2,2,'markdown',15);
/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_upload`
--

DROP TABLE IF EXISTS `sym_fields_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_upload`
--

LOCK TABLES `sym_fields_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_forgotpass`
--

DROP TABLE IF EXISTS `sym_forgotpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_forgotpass`
--

LOCK TABLES `sym_forgotpass` WRITE;
/*!40000 ALTER TABLE `sym_forgotpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_forgotpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages`
--

DROP TABLE IF EXISTS `sym_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages`
--

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages_types`
--

DROP TABLE IF EXISTS `sym_pages_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages_types`
--

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections`
--

DROP TABLE IF EXISTS `sym_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections`
--

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` VALUES (1,'Entries','entries',1,'no','no','Content');
/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections_association`
--

DROP TABLE IF EXISTS `sym_sections_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections_association`
--

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sessions`
--

DROP TABLE IF EXISTS `sym_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sessions`
--

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;
INSERT INTO `sym_sessions` VALUES ('643618dcb02293db45dccbdb7679f5c5',1441855181,'sym-|a:3:{s:10:\"xsrf-token\";s:27:\"Csm5wwwmubnO5qrpCJ6I+Z9SpJc\";s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|cdb9e5571e92620a5eb6|ijWZ0ehPmQZG3vC0vWZTZbDZV/i+s3rfyLiJ0RZqbXDefmNnTwg28A==\";}');
/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-24 17:18:40
