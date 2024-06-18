// This program was cloned from: https://github.com/maxs-well/LMS-sound-filtering-by-Verilog
// License: GNU General Public License v3.0

`timescale 1ns/10ps

module tb_lms;

reg	clk;
reg rst_n;
reg [15:0] d;
reg [15:0] x;
reg [ 3:0] u;
reg [15:0] signal;
wire [15:0] y;
wire [15:0] err;
wire [15:0] out;

initial begin
	clk = 0;
	rst_n = 0;
	signal = 0;
	d = 0;
	x = 0;
	u = 0;
	#100
	rst_n = 1;
	#6000000
	$finish;
end

always #10 clk = ~clk;

lms
//#(
//.W(16)
//) 
lms_inst
(
	.clk	(clk	),
	.rst_n	(rst_n	),
	
	.en 	(1'b1	),
	.din		(d		),
	.xin		(x		),
	.u		(4'd6	),
	.yout		(y		),
	.err    	(err    ),
	.update		()
);

parameter datalen = 32000;

integer k,j,m;
reg [15:0] stimulus_s[1:datalen];
reg [15:0] stimulus_x[1:datalen];
reg [15:0] stimulus_d[1:datalen];

initial
begin
   $readmemb("x_in.txt",stimulus_x);
   k=0;
   repeat(datalen)
    begin
//       #160;
       k=k+1;
       x = stimulus_x[k];
       #160;
    end    
end


initial
begin
   $readmemb("d_in.txt",stimulus_d);
   j =0;
   repeat(datalen)
    begin
//         #160;
         j=j+1;
         d = stimulus_d[j]; 
       #160;
    end    
end

initial
begin
   $readmemb("signal.txt",stimulus_s);
   m=0;
   repeat(datalen)
    begin
//       #160;
       m=m+1;
       signal = stimulus_s[m];
       #160;
    end    
end

/*滤波后的数据输出，保存在out.txt中，用于matlab仿真分析*/
integer file_out;
initial
begin
    file_out = $fopen("lms_err.txt");
    if(!file_out)
        begin
            $display("could not open file");
            $finish;  
        end 
end



wire rst_write;
wire signed[15:0] yout_final;
assign yout_final = err;
// assign rst_write = sclk & (rst_n);//产生写入时钟信号，复位状态下不写入数据
// always @(posedge rst_write)
always @ (posedge clk)
    $fdisplay(file_out,"%d",yout_final);
	
initial begin
	$fsdbDumpfile("tb.fsdb");
	$fsdbDumpvars;
end


endmodule 
