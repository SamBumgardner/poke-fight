package player;

import flixel.FlxG;
import flixel.input.IFlxInputManager;
import flixel.input.actions.FlxActionInput.FlxInputDevice;
import flixel.input.keyboard.FlxKeyboard;

class HeroInput
{
	private var inputDevice:FlxInputDevice = FlxInputDevice.KEYBOARD;
	private var inputManager:IFlxInputManager = FlxG.keys;

	private var leftInput:Int;
	private var rightInput:Int;
	private var retreatInput:Int;
	private var advanceInput:Int;

	public var leftTurn(get, default):Bool;
	public var rightTurn(get, default):Bool;
	public var retreat(get, default):Bool;
	public var advance(get, default):Bool;

	public function new(leftInput:Int, rightInput:Int, retreatInput:Int, advanceInput:Int)
	{
		rebindInput(leftInput, rightInput, retreatInput, advanceInput);
	}

	public inline function rebindInput(leftInput:Int, rightInput:Int, retreatInput:Int, advanceInput:Int)
	{
		this.leftInput = leftInput;
		this.rightInput = rightInput;
		this.retreatInput = retreatInput;
		this.advanceInput = advanceInput;
	}

	public inline function checkInput(inputCode:Int):Bool
	{
		switch inputDevice
		{
			case KEYBOARD:
				return cast(inputManager, FlxKeyboard).checkStatus(inputCode, JUST_PRESSED);
			case _:
				return false;
		}
	}

	public inline function get_leftTurn():Bool
	{
		return checkInput(leftInput);
	}

	public inline function get_rightTurn():Bool
	{
		return checkInput(rightInput);
	}

	public inline function get_retreat():Bool
	{
		return checkInput(retreatInput);
	}

	public inline function get_advance():Bool
	{
		return checkInput(advanceInput);
	}
}
