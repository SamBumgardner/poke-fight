package player;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxDirection;

class Hero extends FlxSprite
{
	private var input:HeroInput;

	static inline final TURN_HEAT_BUILDUP:Float = 30;
	static inline final ADVANCE_HEAT_BUILDUP:Float = 45;
	static inline final RETREAT_HEAT_BUILDUP:Float = 20;
	static inline final HEAT_BUILDUP_MAX:Float = 100;
	static inline final HEAT_BUILDUP_HOLD_TIME_MAX:Float = .5;

	private var heatBuildup(default, set):Float = 0;
	private var heatBuildupHoldTime:Float = 0;
	private var overheated:Bool = false;

	private static var MAP:Array<Array<FlxPoint>>;
	static var DIRECTIONS(default, never):Array<FlxDirection> = [LEFT, UP, RIGHT, DOWN];
	static inline final DIRECTION_COUNT = 4;

	public var position(default, null):Array<Int> = [0, 0];

	private var direction:Int = 0;
	private var previousAction:HeroAction = HeroAction.None;
	private var nextAction:HeroAction = HeroAction.None;

	public function new(map:Array<Array<FlxPoint>>, startXIndex:Int, startYIndex:Int,
			startDirection:FlxDirection, input:HeroInput)
	{
		MAP = map;
		updatePosition(startXIndex, startYIndex);
		super(x, y);

		this.input = input;

		direction = DIRECTIONS.indexOf(startDirection);
	}

	override function update(elapsed:Float)
	{
		if (input.advance)
			trace("advancing");
		if (input.retreat)
			trace("retreating");

		updateFacing();

		super.update(elapsed);
	}

	private function updatePosition(newXPos:Int, newYPos:Int)
	{
		position[0] = newXPos;
		position[1] = newYPos;

		x = MAP[position[0]][position[1]].x;
		y = MAP[position[0]][position[1]].y;
	}

	public function updateFacing()
	{
		if (input.leftTurn)
		{
			turn(-1);
			trace("turned left, now facing", DIRECTIONS[direction]);
		}
		if (input.rightTurn)
		{
			turn(1);
			trace("turned right, now facing", DIRECTIONS[direction]);
		}
	}

	private function turn(change:Int)
	{
		direction = direction + change;
		direction = direction < 0 ? DIRECTION_COUNT - 1 : direction % DIRECTION_COUNT;
		heatBuildup += TURN_HEAT_BUILDUP;
	}

	private inline function set_heatBuildup(newHeatBuildup:Float):Float
	{
		var result:Float;
		if (newHeatBuildup >= HEAT_BUILDUP_MAX)
		{
			overheated = true;
			result = HEAT_BUILDUP_MAX;
		}
		else
		{
			heatBuildupHoldTime = HEAT_BUILDUP_HOLD_TIME_MAX;
			result = newHeatBuildup;
		}

		trace("heatBuildup changed to " + result);
		trace("overheated:", overheated);

		return heatBuildup = result;
	}
}
