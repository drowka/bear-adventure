#message = "Ready for your first Great Very-bear Adventure?"
#alert(message)


cns = document.getElementById('canvas')
ctx = cns.getContext('2d')
x = 0 #(cns.width - img.width) * 0.5
y = 0 #(cns.height - img.width) * 0.5
img = new Image()
img.src = 'bear.jpg'
size = 5
overlap = 10
F = 0.01
ctx.fillStyle = '#fff'
cns.onmousemove = (e) ->
        x = e.offsetX
        y = e.offsetY
img.onload = ->
        ctx.drawImage(img, 0, 0)
        
        bearticles = []
        for x in [0..img.width] by size
                for y in [0..img.height] by size
                        bearticles.push {
                                x: x + 0.5 * (cns.width - img.width),
                                y: y + 0.5 * (cns.height - img.height),
                                imgData: ctx.getImageData(x - 0.5 * overlap, y - 0.5 * overlap, size + overlap, size + overlap)}
        ctx.fillRect(0, 0, cns.width, cns.height);
        tickling = (bear) ->
                dx = x - bear.x
                dy = y - bear.y
                s =  Math.sqrt(dx * dx + dy * dy)
                s *= F
                s = Math.max(1, s)
                ctx.putImageData(bear.imgData, bear.x - dx / s, bear.y - dy / s)

        ctx.fillStyle = 'rgba(255, 255, 255, 1)'        
        draw = ->
                ctx.fillRect(0, 0, cns.width, cns.height)
                tickling(bear) for bear in bearticles
                 
        setInterval(draw, 25)
