using Godot;

public abstract class Actor : KinematicBody2D
{
    public Vector2 FLOOR_NORMAL = Vector2.Up;

    [Export]
    public Vector2 speed = new Vector2(400.0F, 500.0F);

    [Export]
    private float gravity = 3500.0F;

    public Vector2 _velocity = Vector2.Zero;

    public override void _PhysicsProcess(float delta)
    {
        _velocity.y += gravity * delta;
    }
}
