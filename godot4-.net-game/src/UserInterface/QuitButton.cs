using Godot;

public partial class QuitButton : Button
{
    public void _on_button_up()
    {
        GetTree().Quit();
    }
}
