package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import SWF;

class PlayState extends FlxState
{
    override public function create()
    {
        super.create();

        var text = new flixel.text.FlxText(0, 0, 0, "Press 1 to load the SWF.", 64);
        text.screenCenter();
        add(text);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ONE)
        {
            var nyanCat:SWF = new SWF(Paths.file("images/nyancat.swf"), function() {
                FlxG.camera.fade(FlxColor.BLACK, 0.5, false, FlxG.resetGame, false);
            });
            add(nyanCat);
        }
    }
}