using Godot;

public partial class RetryButton : Button
{
    public void _on_button_up()
    {
        PlayerData.Instance.Score = 0;
        GetTree().Paused = false;
        GetTree().ReloadCurrentScene();
    }
}
