using Godot;

public partial class UserInterface : Node
{
    private bool Paused
    {
        get => Paused;
        set
        {
            GetTree().Paused = value;
            var pauseOverlay = GetNode<ColorRect>("PauseOverlay");
            pauseOverlay.Visible = value;
        }
    }

    public override void _Ready()
    {
        PlayerData.Instance.Connect(nameof(PlayerData.Updated), new Callable(this, nameof(UpdateInterface)));
        PlayerData.Instance.Connect(nameof(PlayerData.Died), new Callable(this, nameof(OnPlayerDied)));
        PlayerData.Instance.Connect(nameof(PlayerData.Reset), new Callable(this, nameof(OnPlayerReset)));
        UpdateInterface();
    }

    public void OnPlayerDied()
    {
        Paused = true;
        GetNode<ColorRect>("PauseOverlay").GetNode<Label>("Title").Text = "You died";
    }

    public void OnPlayerReset()
    {
        Paused = false;
    }

    public override void _UnhandledInput(InputEvent @event)
    {
        base._UnhandledInput(@event);
        if (@event.IsActionPressed("pause")) Paused = !Paused;
    }

    private void UpdateInterface()
    {
        var scoreLabel = GetNode<Label>("Score");
        scoreLabel.Text = string.Format("Score: {0}", PlayerData.Instance.Score);
    }
}
