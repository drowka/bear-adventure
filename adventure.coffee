message = "Ready for your first Great Very-bear Adventure?"
alert(message)


cns = document.getElementById('canvas')
ctx = cns.getContext('2d')
x = 0 #(cns.width - img.width) * 0.5
y = 0 #(cns.height - img.width) * 0.5
img = new Image()
img.src = 'http://upload.wikimedia.org/wikipedia/commons/7/77/NROL10_USA155_patch.jpg'

ctx.fillStyle = '#000000'


draw = ->
        ctx.fillRect(0, 0, cns.width, cns.height)
        ctx.drawImage(img, x, y)
        x = if x < cns.width then x + cns.width / 100  else -img.width
        y = if y < cns.height then y + cns.height / 100 else -img.width * cns.height / cns.width 

setInterval(draw, 25)
