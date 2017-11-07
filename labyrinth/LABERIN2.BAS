SCREEN 9
DIM laberinto(40, 40)
pag = 0
LOCATE 1, 1: INPUT "Nombre del archivo que contiene el laberinto : ", nom$
OPEN nom$ + ".lab" FOR INPUT AS #1
a = 1
WHILE (a <= 40)
        b = 1
        WHILE (b <= 40)
                INPUT #1, laberinto(a, b)
                b = b + 1
        WEND
        a = a + 1
WEND
INPUT "Lugar x de llegada : ", xfin
INPUT "Lugar y de llegada : ", yfin
INPUT "Lugar x de comienzo : ", x
INPUT "Lugar y de comienzo : ", y
INPUT "¨ A donde miras ? (norte , sur , este u oeste) ", direccion$
CLS
GOSUB calcular
KEY(11) ON
KEY(12) ON
KEY(13) ON
KEY(14) ON
KEY(1) ON
KEY(2) ON
ON KEY(11) GOSUB avanzar
ON KEY(12) GOSUB izquierda
ON KEY(13) GOSUB derecha
ON KEY(14) GOSUB retroceder
ON KEY(1) GOSUB salir
ON KEY(2) GOSUB mapa
c = 1
DO
LOOP WHILE (c = 1)
END
b1a:
        LINE (20, 320)-(80, 300), 1
        LINE (20, 30)-(80, 50), 1
        LINE (20, 320)-(20, 30), 1
        LINE (80, 300)-(80, 50), 1
        PAINT (40, 175), 1
RETURN
b1b:
        LINE (619, 320)-(559, 300), 1
        LINE (619, 320)-(619, 30), 1
        LINE (619, 30)-(559, 50), 1
        LINE (559, 50)-(559, 300), 1
        PAINT (600, 100), 1
RETURN
b2a:
        LINE (80, 300)-(140, 280), 1
        LINE (140, 280)-(140, 70), 1
        LINE (140, 70)-(80, 50), 1
        LINE (80, 300)-(80, 50), 1
        PAINT (100, 200), 1
RETURN
b2b:
        LINE (559, 300)-(499, 280), 1
        LINE (499, 280)-(499, 70), 1
        LINE (499, 70)-(559, 50), 1
        LINE (559, 300)-(559, 50), 1
        PAINT (513, 100), 1
RETURN
b3a:
        LINE (140, 280)-(190, 263.3), 1
        LINE (190, 263.3)-(190, 86.6), 1
        LINE (190, 86.6)-(140, 70), 1
        LINE (140, 280)-(140, 70), 1
        PAINT (150, 100), 1
RETURN
b3b:
        LINE (499, 280)-(449, 263.3), 1
        LINE (449, 263.3)-(449, 86.6), 1
        LINE (449, 86.6)-(499, 70), 1
        LINE (499, 280)-(499, 70), 1
        PAINT (450, 200), 1
RETURN
b4a:
        LINE (190, 263.3)-(230, 249.9), 1
        LINE (230, 249.9)-(230, 99.9), 1
        LINE (230, 99.9)-(190, 86.6), 1
        LINE (190, 263.3)-(190, 86.6), 1
        PAINT (200, 100), 1
RETURN
b4b:
        LINE (449, 263.3)-(409, 249.9), 1
        LINE (409, 249.9)-(409, 99.9), 1
        LINE (409, 99.9)-(449, 86.6), 1
        LINE (449, 263.3)-(449, 86.6), 1
        PAINT (420, 100), 1
RETURN
b5a:
        LINE (230, 249.9)-(260, 239.9), 1
        LINE (260, 239.9)-(260, 109.9), 1
        LINE (260, 109.9)-(230, 99.9), 1
        LINE (230, 249.9)-(230, 99.9), 1
        PAINT (240, 150), 1
RETURN
b5b:
        LINE (409, 249.9)-(379, 239.9), 1
        LINE (379, 239.9)-(379, 109.9), 1
        LINE (379, 109.9)-(409, 99.9), 1
        LINE (409, 249.9)-(409, 99.9), 1
        PAINT (400, 170), 1
RETURN
b6a:
        LINE (260, 239.9)-(280, 233.2), 1
        LINE (280, 233.2)-(280, 116.5), 1
        LINE (280, 116.5)-(260, 109.9), 1
        LINE (260, 239.9)-(260, 109.9), 1
        PAINT (270, 200), 1
RETURN
b6b:
        LINE (379, 239.9)-(359, 233.2), 1
        LINE (359, 233.2)-(359, 116.5), 1
        LINE (359, 116.5)-(379, 109.9), 1
        LINE (379, 239.9)-(379, 109.9), 1
        PAINT (369, 200), 1
RETURN
b7a:
        LINE (280, 233.2)-(290, 229.8), 1
        LINE (290, 229.8)-(290, 119.8), 1
        LINE (290, 119.8)-(280, 116.5), 1
        LINE (280, 233.2)-(280, 116.5), 1
        PAINT (285, 200), 1
RETURN
b7b:
        LINE (359, 233.2)-(349, 229.8), 1
        LINE (349, 229.8)-(349, 119.8), 1
        LINE (349, 119.8)-(359, 116.5), 1
        LINE (359, 233.2)-(359, 116.5), 1
        PAINT (354, 200), 1
RETURN
calcular:
x1 = x
y2 = y
IF pag = 1 THEN SCREEN 9, , 0, 1
IF pag = 0 THEN SCREEN 9, , 1, 0
LINE (0, 0)-(639, 349), 0, BF
LOCATE 2, (80 - LEN(direccion$)) / 2 - .5: PRINT UCASE$(direccion$)
        IF direccion$ = "norte" THEN GOSUB norte
        IF direccion$ = "sur" THEN GOSUB sur
        IF direccion$ = "este" THEN GOSUB este
        IF direccion$ = "oeste" THEN GOSUB oeste
SELECT CASE pas
        CASE 2
                LINE (80, 50)-(559, 300), 9, BF
        CASE 3
                LINE (140, 70)-(499, 280), 9, BF
        CASE 4
                LINE (190, 86.6)-(449, 263.3), 9, BF
        CASE 5
                LINE (230, 99.9)-(409, 249.9), 9, BF
        CASE 6
                LINE (260, 109.9)-(379, 239.9), 9, BF
        CASE 7
                LINE (280, 116.5)-(359, 233.2), 9, BF
        CASE 8
                LINE (290, 119.8)-(349, 229.8), 9, BF
        CASE ELSE
                LINE (290, 119.8)-(349, 229.8), 9, BF
        END SELECT
IF pag = 1 THEN SCREEN 9, , 0, 0
IF pag = 0 THEN SCREEN 9, , 1, 1
SELECT CASE pag
        CASE 1
        pag = 0
        CASE 0
        pag = 1
END SELECT
RETURN
norte:
       pas = 1
       DO WHILE (laberinto(x1, y2) = 0)
                IF laberinto(x1 - 1, y2) <> 0 THEN GOSUB selec1 ELSE GOSUB selec3
                IF laberinto(x1 + 1, y2) <> 0 THEN GOSUB selec2 ELSE GOSUB selec4
                y2 = y2 - 1
                pas = pas + 1
                IF y2 = -1 THEN EXIT DO
       LOOP
RETURN
sur:
       pas = 1
       DO WHILE (laberinto(x1, y2) = 0)
                IF laberinto(x1 + 1, y2) <> 0 THEN GOSUB selec1 ELSE GOSUB selec3
                IF laberinto(x1 - 1, y2) <> 0 THEN GOSUB selec2 ELSE GOSUB selec4
                y2 = y2 + 1
                pas = pas + 1
                IF y2 = 41 THEN EXIT DO
       LOOP
RETURN
este:
       pas = 1
       DO WHILE (laberinto(x1, y2) = 0)
                IF laberinto(x1, y2 - 1) <> 0 THEN GOSUB selec1 ELSE GOSUB selec3
                IF laberinto(x1, y2 + 1) <> 0 THEN GOSUB selec2 ELSE GOSUB selec4
                x1 = x1 + 1
                pas = pas + 1
                IF x1 = 41 THEN EXIT DO
       LOOP
RETURN
oeste:
       pas = 1
       DO WHILE (laberinto(x1, y2) = 0)
                IF laberinto(x1, y2 + 1) <> 0 THEN GOSUB selec1 ELSE GOSUB selec3
                IF laberinto(x1, y2 - 1) <> 0 THEN GOSUB selec2 ELSE GOSUB selec4
                x1 = x1 - 1
                pas = pas + 1
                IF x1 = -1 THEN EXIT DO
       LOOP
RETURN
selec1:
        SELECT CASE pas
                CASE 1
                        GOSUB b1a
                CASE 2
                        GOSUB b2a
                CASE 3
                        GOSUB b3a
                CASE 4
                        GOSUB b4a
                CASE 5
                        GOSUB b5a
                CASE 6
                        GOSUB b6a
                CASE 7
                        GOSUB b7a
        END SELECT
RETURN
selec2:
        SELECT CASE pas
                CASE 1
                        GOSUB b1b
                CASE 2
                        GOSUB b2b
                CASE 3
                        GOSUB b3b
                CASE 4
                        GOSUB b4b
                CASE 5
                        GOSUB b5b
                CASE 6
                        GOSUB b6b
                CASE 7
                        GOSUB b7b
        END SELECT
RETURN
selec3:
        SELECT CASE pas
                CASE 1
                        LINE (20, 50)-(80, 300), 9, BF
                CASE 2
                        LINE (81, 70)-(140, 280), 9, BF
                CASE 3
                        LINE (141, 86.6)-(190, 263.3), 9, BF
                CASE 4
                        LINE (191, 99.9)-(230, 249.9), 9, BF
                CASE 5
                        LINE (231, 109.9)-(260, 239.9), 9, BF
                CASE 6
                        LINE (261, 116.5)-(280, 233.2), 9, BF
                CASE 7
                        LINE (281, 119.8)-(290, 229.8), 9, BF
        END SELECT
RETURN
selec4:
        SELECT CASE pas
                CASE 1
                        LINE (559, 50)-(618, 300), 9, BF
                CASE 2
                        LINE (558, 70)-(499, 280), 9, BF
                CASE 3
                        LINE (449, 86.6)-(498, 263.3), 9, BF
                CASE 4
                        LINE (409, 99.9)-(448, 249.9), 9, BF
                CASE 5
                        LINE (379, 109.9)-(408, 239.9), 9, BF
                CASE 6
                        LINE (359, 116.5)-(378, 233.2), 9, BF
                CASE 7
                        LINE (349, 119.8)-(358, 229.8), 9, BF
       END SELECT
RETURN
avanzar:
        SELECT CASE direccion$
                CASE "norte"
                        IF laberinto(x, y - 1) <> 0 THEN RETURN
                        y = y - 1
                        GOSUB calcular
                CASE "sur"
                        IF laberinto(x, y + 1) <> 0 THEN RETURN
                        y = y + 1
                        GOSUB calcular
                CASE "este"
                        IF laberinto(x + 1, y) <> 0 THEN RETURN
                        x = x + 1
                        GOSUB calcular
                CASE "oeste"
                        IF laberinto(x - 1, y) <> 0 THEN RETURN
                        x = x - 1
                        GOSUB calcular
        END SELECT
IF xfin = x AND yfin = y THEN GOSUB fin
RETURN
izquierda:
        IF direccion$ = "norte" THEN
                direccion$ = "oeste"
        ELSEIF direccion$ = "oeste" THEN
                direccion$ = "sur"
        ELSEIF direccion$ = "sur" THEN
                direccion$ = "este"
        ELSEIF direccion$ = "este" THEN
                direccion$ = "norte"
        END IF
GOSUB calcular
RETURN
derecha:
        IF direccion$ = "norte" THEN
                direccion$ = "este"
        ELSEIF direccion$ = "este" THEN
                direccion$ = "sur"
        ELSEIF direccion$ = "sur" THEN
                direccion$ = "oeste"
        ELSEIF direccion$ = "oeste" THEN
                direccion$ = "norte"
        END IF
GOSUB calcular
RETURN
retroceder:
        SELECT CASE direccion$
                CASE "norte"
                        IF laberinto(x, y + 1) <> 0 THEN RETURN
                        y = y + 1
                        GOSUB calcular
                CASE "sur"
                        IF laberinto(x, y - 1) <> 0 THEN RETURN
                        y = y - 1
                        GOSUB calcular
                CASE "este"
                        IF laberinto(x - 1, y) <> 0 THEN RETURN
                        x = x - 1
                        GOSUB calcular
                CASE "oeste"
                        IF laberinto(x + 1, y) <> 0 THEN RETURN
                        x = x + 1
                        GOSUB calcular
        END SELECT
IF xfin = x AND yfin = y THEN GOSUB fin
RETURN
mapa:
LOCATE 23, 26: PRINT "Necesitas una ayuda ¨eh? "
SLEEP 2
CLS
LOCATE 4, 55: PRINT "Est s mirando al "; direccion$
FOR a = 0 TO 280 STEP 7
        LINE (0, a)-(400, a), 15
NEXT
FOR a = 0 TO 400 STEP 10
        LINE (a, 0)-(a, 280), 15
NEXT
LINE (440, 75)-(448, 80), 13, BF
LINE (440, 103)-(448, 108), 15, BF
LOCATE 6, 58: PRINT "Paredes"
LOCATE 8, 58: PRINT "T£"
PAINT (10 * xfin - 5, 7 * yfin - 3), 14, 15
a = 1
b = 1
WHILE (a <= 40)
        b = 1
        WHILE (b <= 40)
        IF laberinto(b, a) <> 0 THEN PAINT (10 * b - 5, a * 7 - 3), 13, 15
        b = b + 1
        WEND
a = a + 1
WEND
PAINT (10 * x - 5, 7 * y - 3), 15
SLEEP 10
CLS
GOSUB calcular
RETURN
fin:
salir:

