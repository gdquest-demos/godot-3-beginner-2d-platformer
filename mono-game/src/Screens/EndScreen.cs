using System;
using Godot;

public class EndScreen : Control
{
    public override void _Ready()
    {
        var result = GetNode<Label>("Result");
        result.Text = String.Format(result.Text, PlayerData.Instance.Score, PlayerData.Instance.Deaths);
    }
}
