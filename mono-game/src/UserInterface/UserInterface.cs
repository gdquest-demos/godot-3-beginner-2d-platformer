using System;
using Godot;

public class UserInterface : Node
{

    private bool paused
    {
        get
        {
            return paused;
        }
        set
        {
            GetTree().Paused = value;
            var pause_overlay = GetNode<ColorRect>("PauseOverlay");
            pause_overlay.Visible = value;
        }
    }

    public override void _Ready()
    {
        PlayerData.Instance.Connect("Updated", this, "update_interface");
        PlayerData.Instance.Connect("Died", this, "_on_Player_died");
        PlayerData.Instance.Connect("Reset", this, "_on_Player_reset");
        update_interface();
    }

    public void _on_Player_died()
    {
        paused = true;
        GetNode<ColorRect>("PauseOverlay").GetNode<Label>("Title").Text = "You died";
    }

    public void _on_Player_reset()
    {
        paused = false;
    }

    public override void _UnhandledInput(InputEvent @event)
    {
        base._UnhandledInput(@event);
        if (@event.IsActionPressed("pause"))
        {
            paused = !paused;
        }
    }
    public void update_interface()
    {
        var score_label = GetNode<Label>("Score");
        score_label.Text = String.Format("Score: {0}", PlayerData.Instance.Score);

    }
}
