using Godot;

public partial class Enemy : Actor
{
    [Export] private int score = 100;

    public override void _Ready()
    {
        Velocity = new Vector2(Velocity.X - speed.X, Velocity.Y);
    }

    public override void _PhysicsProcess(double delta)
    {
        base._PhysicsProcess(delta);
        Velocity = new Vector2(Velocity.X * (IsOnWall() ? -1 : 1), Velocity.Y);
        MoveAndSlide();
    }

    public void _on_StompArea2D_area_entered(Area2D area)
    {
        var stompArea = GetNode<Area2D>("StompArea2D");

        if (area.GlobalPosition.Y > stompArea.GlobalPosition.Y) return;

        Die();
    }

    private void Die()
    {
        PlayerData.Instance.Score += score;
        QueueFree();
    }
}
