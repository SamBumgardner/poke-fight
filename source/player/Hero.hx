package player;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxDirection;

class Hero extends FlxSprite
{
	private static var DIRECTIONS(default, never):Array<FlxDirection> = [LEFT, UP, RIGHT, DOWN];
	private static var MAP:Array<Array<FlxPoint>>;

	private var input:HeroInput;

	public var position(default, null):Array<Int> = [0, 0];

	private var targetDestination:FlxObject;

	private var previousAction:HeroAction = HeroAction.None;
	private var nextAction:HeroAction = HeroAction.None;
	private var heatBuildup:Float;
	private var overheated:Bool;

	public function new(map:Array<Array<FlxPoint>>, startXIndex:Int, startYIndex:Int,
			startFacing:FlxDirection, input:HeroInput)
	{
		MAP = map;
		updatePosition(startXIndex, startYIndex);
		super(x, y);

		this.input = input;
		facing = startFacing;
	}

	override function update(elapsed:Float)
	{
		if (input.advance)
			trace("advancing");
		if (input.retreat)
			trace("retreating");
		if (input.leftTurn)
			trace("turn left");
		if (input.rightTurn)
			trace("turn right");

		super.update(elapsed);
	}

	public function updatePosition(newXPos:Int, newYPos:Int)
	{
		position[0] = newXPos;
		position[1] = newYPos;

		x = MAP[position[0]][position[1]].x;
		y = MAP[position[0]][position[1]].y;
	}
}
