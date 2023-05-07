using Godot;

public partial class SceneChangeButton : Button
{
    [Export] private string next_scene_path = "";

    public void _on_button_up()
    {
        GetTree().ChangeSceneToFile(next_scene_path);
    }
}
