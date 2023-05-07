using Godot;

public partial class Player : Actor
{
    [Export] private float stompImpulse = 600.0F;

    public void _on_StompDetector_area_entered(Area2D area)
    {
        Velocity = CalculateStompVelocity(Velocity, stompImpulse);
    }

    public void _on_EnemyDetector_body_entered(PhysicsBody2D body)
    {
        Die();
    }

    public override void _PhysicsProcess(double delta)
    {
        base._PhysicsProcess(delta);
        var isJumpInterrupted = Input.IsActionJustReleased("jump") && Velocity.Y < 0.0F;

        var direction = GetDirection();
        Velocity = CalculateMoveVelocity(Velocity, direction, speed, isJumpInterrupted);

        var snap = direction.Y == 0.0 ? 60 * Vector2.Down : Vector2.Zero;
        MoveAndSlide();
        FloorSnapLength = snap.Y;
    }

    private Vector2 GetDirection()
    {
        return new Vector2(
            Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left"),
            IsOnFloor() && Input.IsActionJustPressed("jump") ? -Input.GetActionStrength("jump") : 0.0F);
    }

    private Vector2 CalculateMoveVelocity(Vector2 linearVelocity, Vector2 direction, Vector2 speed,
        bool isJumpInterrupted)
    {
        var velocity = linearVelocity;
        velocity.X = speed.X * direction.X;

        if (direction.Y != 0.0) velocity.Y = speed.Y * direction.Y;

        if (isJumpInterrupted) velocity.Y = 0.0F;

        return velocity;
    }

    private Vector2 CalculateStompVelocity(Vector2 linearVelocity, float stompImpulse)
    {
        var stompJump = Input.IsActionPressed("jump") ? -speed.Y : -stompImpulse;

        return new Vector2(linearVelocity.X, stompJump);
    }

    private void Die()
    {
        PlayerData.Instance.Deaths += 1;
        QueueFree();
    }
}
