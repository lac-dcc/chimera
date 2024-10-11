// This program was cloned from: https://github.com/Motherboard77/CORDIC-2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module wave_gen_test();

//parameter M=22;
//parameter N=16;
//reg signed[N-1:0] theta_in;
//reg clk,rst;
//wire signed [M-1:0] cos_theta;
//wire signed [M-1:0] sin_theta;
//integer i;
//reg valid;
//integer outFile;

//wave_generator WAVES(theta_in,clk,rst,cos_theta,sin_theta);
//initial
//begin
//    clk = 0;
//    valid = 0;
//    outFile = $fopen("wave_data.txt","w");
//    #200 valid =1;
//    //#395 valid =0;
//end

//initial 
//begin
//#5
//    theta_in = -29491;
//    for(i=0;i<100;i=i+1)
//        begin
//        #174 theta_in = theta_in + 3276;
//        end
//        #6000 $fclose(outFile);
//        $finish;
//end

//always 
//    #10 clk = ~clk;

//initial
//$monitor($time,"theta=%d,cos_theta=%d,sin_theta=%d",theta_in,cos_theta,sin_theta);
//always @(posedge clk)
//if(valid)
//$fwrite(outFile,"%d%d\n",cos_theta,sin_theta);


//module clock_control_unit(input clk,input CON,output wire out_clk);
reg clk=1'b1;
reg CON;
wire out_clk;

clock_control_unit(clk,CON,out_clk);

always 
#10 clk = ~clk;

initial begin
#5
CON = 1;

end

endmodule
