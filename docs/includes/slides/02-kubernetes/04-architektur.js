var canvasArchitektur1 = document.getElementById('canvasArchitektur1');

rectangle(canvasArchitektur1, 20, 400, 860, 80, yellow, 'Hardware (Virtualisation)', 'black');

rectangle(canvasArchitektur1, 140, 60, 280, 280, green, null, null);
rectangle(canvasArchitektur1, 140, 20, 150, 40, green, 'Master Node', 'black');
rectangle(canvasArchitektur1, 180, 90, 200, 60, green, 'Api Server', 'black');
rectangle(canvasArchitektur1, 180, 170, 200, 60, green, 'Scheduler', 'black');
rectangle(canvasArchitektur1, 180, 250, 200, 60, green, 'Controllers', 'black');
ellipse(canvasArchitektur1, 20, 280, 100, 60, green, 'etcd', 'black');

rectangle(canvasArchitektur1, 860, 80, 20, 260, burgundy, null, null);
rectangle(canvasArchitektur1, 480, 60, 380, 280, burgundy, null, null);
rectangle(canvasArchitektur1, 480, 20, 150, 40, burgundy, 'Worker Nodes', 'black');
rectangle(canvasArchitektur1, 520, 90, 140, 60, burgundy, 'Kubelet', 'black');
rectangle(canvasArchitektur1, 680, 90, 140, 60, burgundy, 'Kube-Proxy', 'black');
rectangle(canvasArchitektur1, 520, 170, 300, 60, burgundy, 'Container Engine', 'black');
rectangle(canvasArchitektur1, 520, 250, 80, 60, blue, 'Pod', 'black');
rectangle(canvasArchitektur1, 630, 250, 80, 60, blue, 'Pod', 'black');
rectangle(canvasArchitektur1, 740, 250, 80, 60, blue, 'Pod', 'black');
