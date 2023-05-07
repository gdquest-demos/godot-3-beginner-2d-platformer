using Godot;

public partial class Actor : CharacterBody2D
{
    [Export] private float gravity = 3500.0F;

    [Export] protected Vector2 speed = new(400.0F, 500.0F);

    public override void _PhysicsProcess(double delta)
    {
        Velocity = new Vector2(Velocity.X, Velocity.Y + gravity * (float)delta);
    }
}
