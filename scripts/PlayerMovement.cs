using Godot;
using System;
public partial class PlayerMovement : Godot.Node2D
{
	[Export]
	public int Speed { get; set; } = 400; // How fast the player will move (pixels/sec).
	public Vector2 ScreenSize; // Size of the game window.
	// Called when the node enters the scene tree for the first time.
	public override void _Ready(){
		ScreenSize = GetViewportRect().Size;
	}
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override async void _Process(double delta){
		var velocity = Vector2.Zero; // The player's movement vector.

		if (Input.IsActionPressed("ui_right")){
			velocity.X += 1;
		}

		if (Input.IsActionPressed("ui_left")){
			velocity.X -= 1;
		}

		if (Input.IsActionPressed("ui_down")){
			velocity.Y += 1;
		}

		if (Input.IsActionPressed("ui_up")){
			velocity.Y -= 1;
		}

		var sprite2D = GetNode<Sprite2D>("Sprite2D");

		if (velocity.Length() > 0){
			velocity = velocity.Normalized() * Speed;
			
		}else{
			
		}
	}
}
