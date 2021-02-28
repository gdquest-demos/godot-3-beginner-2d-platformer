using Godot;

public class Portal2D : Area2D
{
    [Export]
    private PackedScene next_scene;
    public void _on_body_entered(PhysicsBody2D body)
    {
        teleport();
    }

    public override string _GetConfigurationWarning()
    {
        return (next_scene == null) ? "The property Next Level can't be empty" : "";
    }


    public async void teleport()
    {
        GetTree().Paused = true;
        var anim_player = GetNode<AnimationPlayer>("AnimationPlayer");
        anim_player.Play("fade_out");
        await ToSignal(anim_player, "animation_finished");
        GetTree().Paused = false;
        GetTree().ChangeSceneTo(next_scene);
    }
}
