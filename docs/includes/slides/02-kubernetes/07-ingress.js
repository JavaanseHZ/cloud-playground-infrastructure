var canvasIngress1 = document.getElementById('canvasIngress1');

rectangleWithTextSize(canvasIngress1, 10, 420, 100, 50, burgundy, 'Cluster', 'black', 30);
rectangle(canvasIngress1, 10, 160, 300, 260, burgundy, '', 'black');

rectangleWithTextSize(canvasIngress1, 100, 10, 120, 70, lightBrown, 'Request', 'black', 30);

arrow (canvasIngress1, 160, 90, 160, 150, green);

rectangleWithTextSize(canvasIngress1, 60, 170, 200, 70, orange, 'Ingress', 'black', 30);

arrow (canvasIngress1, 120, 250, 90, 300, green);
arrow (canvasIngress1, 200, 250, 230, 300, green);

rectangleWithTextSize(canvasIngress1, 40, 310, 100, 70, purple, 'Service', 'black', 30);
rectangleWithTextSize(canvasIngress1, 180, 310, 100, 70, purple, 'Service', 'black', 30);
