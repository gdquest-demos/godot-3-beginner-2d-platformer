using Godot;

public class QuitButton : Button
{
    public void _on_QuitButton_button_up()
    {
        GD.Print("Hello from C# to Godot :)");
        GetTree().Quit();
    }
}
