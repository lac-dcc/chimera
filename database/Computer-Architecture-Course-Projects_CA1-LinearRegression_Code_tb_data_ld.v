// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License



module tb1();

reg [19:0] inx,iny;
wire [19:0] outx,outy;
wire cout,en_coef,en_err,finishd;
reg [7:0] n;
reg clk = 0,start = 0,coef_done = 0,coef_finish = 0,err_done = 0;
data_ld UUT(clk,inx,iny,outx,outy,cout,start,coef_done,coef_finish,err_done,
			en_coef,en_err,finishd,con_state);
reg [19:0] mem_x[0:149], mem_y[0:149];
always  #25 clk = ~clk;
initial
	begin
	$readmemb("x_value.txt", mem_x); 
	$readmemb("y_value.txt", mem_y);
	#15 ;
	#50 start=1;
	#50 start = 0;
	for(n=0;n<=149;n=n+1)
		begin
			#50 inx = mem_x[n];iny = mem_y[n];
		end
	#150;
	n = 0;
	for(n=0;n<=149;n=n+1)
		begin
			#50 coef_done = 1;
			#50 coef_done = 0;
			#100;
		end
	#500 coef_finish = 1;
	#200;
	n = 0;
	for(n=0;n<=149;n=n+1)
		begin
			#100 err_done = 1;
			#50 err_done = 0;
		end
	#1000 $stop;
	end
	
endmodule
