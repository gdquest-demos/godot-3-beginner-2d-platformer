using Godot;

public class QuitButton : Button
{
    public void _on_QuitButton_button_up()
    {
        GetTree().Quit();
    }
}
