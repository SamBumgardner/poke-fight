package player;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxDirectionFlags;

class Player extends FlxSprite
{
	private static var MAP:Array<Array<FlxPoint>>;

	public var position:Array<Int>;
	public var targetDestination:FlxObject;

	public function new(map:Array<Array<FlxPoint>>, startXIndex:Int, startYIndex:Int, startFacing:FlxDirectionFlags)
	{
		MAP = map;

		super(x, y);
		position = [startXIndex, startYIndex];

		facing = startFacing;
	}
}
