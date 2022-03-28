package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.util.FlxDirection;
import player.Hero;
import player.HeroInput;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var map = generateBasicMap();
		var heroInput0 = new HeroInput(FlxKey.LEFT, FlxKey.RIGHT, FlxKey.DOWN, FlxKey.UP);
		add(new Hero(map, 0, 0, FlxDirection.RIGHT, heroInput0));

		var heroInput1 = new HeroInput(FlxKey.A, FlxKey.D, FlxKey.S, FlxKey.W);
		add(new Hero(map, 2, 2, FlxDirection.LEFT, heroInput1));
	}

	private function generateBasicMap():Array<Array<FlxPoint>>
	{
		return [
			for (x in 0...3) [
				for (y in 0...3)
					new FlxPoint((1 + x) / 4 * FlxG.width, (1 + y) / 4 * FlxG.height)
			]
		];
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
