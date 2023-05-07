using Godot;

public partial class Coin : Area2D
{
    [Export] private int score = 100;

    public void _on_body_entered(PhysicsBody2D body)
    {
        Picked();
    }

    private void Picked()
    {
        PlayerData.Instance.Score += score;
        GetNode<AnimationPlayer>("AnimationPlayer").Play("picked");
    }
}
