using System;
using Godot;

public class SceneChangeButton : Button
{
    public void _on_SceneChangeButton_button_up()
    {
        GetTree().ChangeScene("res://src/Levels/Level01.tscn");
    }
}
