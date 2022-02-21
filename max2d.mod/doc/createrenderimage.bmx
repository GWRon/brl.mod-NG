' createrenderimage.bmx
'
' creates a 200x200 pixel gradient on via render targets and normal
' draw commands
SuperStrict
Framework Brl.StandardIO
Import Brl.GLMax2D

Graphics(800, 600)

'create a new render target with 200x200 pixels
Local rt:TRenderImage = CreateRenderImage(200, 200, False)

'redirect all following draw commands into the render image
SetRenderImage(rt)
For local i:int = 0 until 200
	SetColor(i*1,0,0)
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
