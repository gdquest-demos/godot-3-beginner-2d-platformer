using Godot;

public class Enemy : Actor
{

    [Export]
    private int score = 100;

    public override void _Ready()
    {
        SetPhysicsProcess(false);

        _velocity.x = -speed.x;
    }

    public override void _PhysicsProcess(float delta)
    {
        base._PhysicsProcess(delta);
        _velocity.x *= IsOnWall() ? -1 : 1;
        _velocity.y = MoveAndSlide(_velocity, FLOOR_NORMAL).y;
    }


    public void _on_StompArea2D_area_entered(Area2D area)
    {
        var stomp_area = GetNode<Area2D>("StompArea2D");

        if (area.GlobalPosition.y > stomp_area.GlobalPosition.y)
        {
            return;
        }
        die();
    }


    public void die()
    {
        PlayerData.Instance.Score += score;
        QueueFree();
    }
}
