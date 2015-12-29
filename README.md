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
- Place the graphic assets elements from the folder "atlas" on a separate layers of the animation movieclips, one per layer, and animate them. You can use classic tweens to animate objects smoothly. You can give a key frame a label equal to the one of Transitions so the sprite would be animated with a transition function specified. If may also add an empty keyframe to hide an element.
 

## Timing
Flarling will use your project's FPS so you will see 50 or 60 FPS animations with the same timing. That means, you can have your FLA on the 12 FPS and your mobile project on 60 FPS.

## Blend modes
Don't forget to register missing Starling blend modes before adding an animation using them.

## Texture atlas
You may use the same MovieClips to create a texture atlas to use with Flarling OR use another atlas with the same subTexture names including four zeroes "0000".
