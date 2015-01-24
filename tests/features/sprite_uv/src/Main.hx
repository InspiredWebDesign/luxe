
import luxe.Input;
import luxe.Sprite;
import luxe.Text;
import luxe.Color;
import luxe.Vector;
import luxe.Rectangle;

class Main extends luxe.Game {


    var stars : Sprite;
    var sky : Sprite;
    var mousetext : Text;


    override function ready() {

        var ratio = Luxe.screen.w / Luxe.screen.h;

        sky = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.loadTexture('assets/bg_sky.png')
        });

        stars = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.loadTexture('assets/bg_stars.png')
        });

        mousetext = new Text({
            pos : new Vector(20,20),
            point_size : 20,
            color : new Color().rgb(0xff440b),
            text : "mouse pos :"
        });

        stars.texture.filter = phoenix.Texture.FilterType.nearest;
        stars.texture.clamp = phoenix.Texture.ClampType.repeat;

        Luxe.on('window.resized', on_resize);

    } //ready

    function on_resize( _event: snow.types.Types.WindowEvent ) {

        var w = _event.event.x;
        var h = _event.event.y;
        var ratio = w / h;

        stars.size = sky.size = new Vector(w, w / ratio);
        Luxe.camera.viewport = new Rectangle(0,0,w,h);

    }

    override function onmousemove( e:MouseEvent ) {

        mousetext.text = 'mouse pos' + e.pos;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if( e.keycode == Key.enter && e.mod.alt ) {
            app.app.window.fullscreen = !app.app.window.fullscreen;
        }


        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        stars.uv.y -= 4 * dt;
        stars.uv.x += 8 * dt;

    } //update


} //Main
