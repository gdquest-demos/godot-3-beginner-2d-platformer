using Godot;

public partial class Portal2D : Area2D
{
    [Export] private PackedScene next_scene;

    public void _on_body_entered(PhysicsBody2D body)
    {
        Teleport();
    }

    public override string[] _GetConfigurationWarnings()
    {
        return next_scene == null ? new[] { "The property Next Level can't be empty" } : new[] { "" };
    }

    private async void Teleport()
    {
        GetTree().Paused = true;
        var animPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
        animPlayer.Play("fade_out");
        await ToSignal(animPlayer, "animation_finished");
        GetTree().Paused = false;
        GetTree().ChangeSceneToPacked(next_scene);
    }
}
