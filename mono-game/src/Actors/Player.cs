using Godot;

public class Player : Actor
{
    [Export]
    private float stomp_impulse = 600.0F;


    public void _on_StompDetector_area_entered(Area2D area)
    {
        _velocity = calculate_stomp_velocity(_velocity, stomp_impulse);
    }

    public void _on_EnemyDetector_body_entered(PhysicsBody2D body)
    {
        die();
    }

    public override void _PhysicsProcess(float delta)
    {
        base._PhysicsProcess(delta);
        var is_jump_interrupted = Input.IsActionJustReleased("jump") && _velocity.y < 0.0F;

        var direction = get_direction();
        _velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted);

        var snap = (direction.y == 0.0) ? (60 * Vector2.Down) : Vector2.Zero;
        _velocity = MoveAndSlideWithSnap(
            _velocity, snap, FLOOR_NORMAL, true
        );
    }

    public Vector2 get_direction()
    {
        return new Vector2(
            Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left"),
            (IsOnFloor() && Input.IsActionJustPressed("jump")) ? -Input.GetActionStrength("jump") : 0.0F
    );
    }
    public Vector2 calculate_move_velocity(
        Vector2 linear_velocity,
        Vector2 direction,
        Vector2 speed,
        bool is_jump_interrupted

    )
    {
        var velocity = linear_velocity;
        velocity.x = speed.x * direction.x;

        if (direction.y != 0.0)
        {

            velocity.y = speed.y * direction.y;
        }

        if (is_jump_interrupted)
        {

            velocity.y = 0.0F;
        }

        return velocity;
    }

    private Vector2 calculate_stomp_velocity(Vector2 linear_velocity, float stomp_impulse)
    {
        var stomp_jump = Input.IsActionJustPressed("jump") ? -speed.y : -stomp_impulse;

        return new Vector2(linear_velocity.x, stomp_jump);
    }


    public void die()
    {
        PlayerData.Instance.Deaths += 1;
        QueueFree();
    }

}
