' clearrenderimage.bmx
'
' creates a 200x200 pixel gradient on via render targets and normal
' draw commands
' then resets content again ... and draws something new on top
SuperStrict
Framework Brl.StandardIO
Import Brl.GLMax2D

Graphics(800, 600)
SetBlend(AlphaBlend)

'create a new render target with 200x200 pixels
Local rt:TRenderImage = CreateRenderImage(200, 200, False)

'redirect all following draw commands into the render image
SetRenderImage(rt)
'start with a white background
ClearRenderImage(rt, 255,255,255, 1.0)
For local i:int = 100 until 200
	SetColor(0, i*1,0)
	DrawRect(i, 0, 1, 200)
Next
SetColor(255,255,255)

'from now on render to "window" again
SetRenderImage(null)

SetClsColor 20,80,200
While Not KeyDown(KEY_ESCAPE)    
    Cls
    DrawImage(rt, MouseX(), MouseY())

    Flip
Wend
