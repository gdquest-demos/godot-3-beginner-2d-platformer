using Godot;

public class Coin : Area2D
{
    [Export]
    private int score = 100;


    public void _on_body_entered(PhysicsBody2D body)
    {
        picked();
    }


    public void picked()
    {
        PlayerData.Instance.Score += score;
        GetNode<AnimationPlayer>("AnimationPlayer").Play("picked");
    }
}
