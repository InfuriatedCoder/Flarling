# Flarling
A Starling animations export converter and player

## Description
Flarling allows you to export an animation from native Adobe's .FLA file format.
It supports a limited list of animatable parameters only:
- position
- rotation
- alpha
- scale
- blendMode
- key frames may have different Transition modes
- Flarling uses Starling juggler to animate elements so it can be paused as other animatables

Flarling requires a specific .fla files which follow the following guidelines:

## Guidelines

- Create a .fla file and add the graphic assets you will use in the library (preferably in a separate folder called "assets").
- Put each graphic assets element in a separate MovieClip and drop these MovieClips into another folder (you may call it 'atlas' if you want to convert them into an atlas later)
- Create a number of MovieClips (preferably in a separate folder, too), give them names with a prefix "animation": "animation_character", "animation_explosion", etc.
- Each animation movieclip should have an empty layer with keyframes labelled as you want ('idle', 'walk' etc.)
- 
