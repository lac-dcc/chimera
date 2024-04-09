add wave clk Sa Sb state lightA lightB
force clk 0 0, 1 5 sec -repeat 10 sec
force Sa 1 0, 0 40, 1 170, 0 230, 1 250 sec
force Sb 0 0, 1 70, 0 100, 1 120, 0 150, 1 210, 0 250, 1 270 sec
run 300 sec
