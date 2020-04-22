var canvasCiCd1 = document.getElementById('canvasCiCd1');

rectangleWithTextSize(canvasCiCd1, 420, 70, 140, 40, burgundy, 'CI / CD Cluster', 'black', 20)
rectangle(canvasCiCd1, 40, 110, 520, 185, burgundy, '', 'black')
rectangleWithTextSize(canvasCiCd1, 420, 320, 140, 40, burgundy, 'App Cluster', 'black', 20)
rectangle(canvasCiCd1, 40, 360, 520, 100, burgundy, '', 'black')

rectangleWithTextSize(canvasCiCd1, 70, 380, 60, 60, burgundy, 'App', 'black', 30);
rectangleWithTextSize(canvasCiCd1, 150, 380, 60, 60, burgundy, 'App', 'black', 30);
rectangleWithTextSize(canvasCiCd1, 220, 380, 60, 60, burgundy, 'App', 'black', 30);

rectangleWithTextSize(canvasCiCd1, 10, 10, 120, 60, orange, 'Source', 'black', 30);


svgPolygon(canvasCiCd1, [[70,130], [100,160], [70,190], [500,190], [530,160], [500,130]], yellow, 'CI (e.g. Jenkins)', 'black', 30, 300, 160);
svgPolygon(canvasCiCd1, [[100,210], [70,240], [100,270], [530,270], [500,240], [530,210]], blue, 'CD (e.g. Spinnaker)', 'black', 30, 300, 240);

rectangleWithTextSize(canvasCiCd1, 600, 170, 120, 60, orange, 'Image', 'black', 30);

arrow (canvasCiCd1, 60, 80, 120, 120, green);

arrow (canvasCiCd1, 540, 160, 590, 180, green);
arrow (canvasCiCd1, 590, 220, 540, 240, green);


arrow (canvasCiCd1, 105, 280, 105, 370, green);
arrow (canvasCiCd1, 175, 280, 175, 370, green);
arrow (canvasCiCd1, 245, 280, 245, 370, green);
