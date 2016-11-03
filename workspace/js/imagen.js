imagen = function( ruta, filename ) {
    console.log(ruta);
    console.log(filename);
    var _height = window.screen.availHeight;
    var _div = document.getElementById("contenido");
    var _width = _div.clientWidth;
    console.log(_height);
    console.log(_width);
    var _img = document.createElement("img");
    _img.setAttribute("src", ruta + "/image/4/" + _height + "/" + _width + "/" + filename);
    _div.appendChild(_img);

}