// This program was cloned from: https://github.com/Motherboard77/CORDIC-2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

//module wave_generator(clk);
//input clk;

//reg [23:0] inv_tan[0:15];

////create a LUT to store all the TAN INVERSE values. The vlalues will be stored in radians. Store it in a memory
//initial begin
//inv_tan[0]  = 24'b0000_0111_1000_0101_0011_1001;  //45 degrees, stored here as 0.78539 radian
//inv_tan[1]  = 24'b0000_0100_0110_0011_0101_0101;  //0.46355 radian
//inv_tan[2]  = 24'b0000_0010_0100_0100_1001_0111;  //0.24497 radian
//inv_tan[3]  = 24'b0000_0001_0010_0100_0011_0101;  //0.12435 radian
//inv_tan[4]  = 24'b0000_0000_0110_0010_0100_0001;  //0.06241 radian
//inv_tan[5]  = 24'b0000_0000_0011_0001_0010_0010;  //0.03122 radian
//inv_tan[6]  = 24'b0000_0000_0001_0101_0110_0010;  //0.01562 radian
//inv_tan[7]  = 24'b0000_0000_0000_0111_1000_0000;  //0.00780 radian
//inv_tan[8]  = 24'b0000_0000_0000_0011_1000_1001;  //0.00389 radian
//inv_tan[9]  = 24'b0000_0000_0000_0001_1001_0101;  //0.00195 radian
//inv_tan[10] = 24'b0000_0000_0000_0000_1001_0101;  //0.00095 radian
//inv_tan[11] = 24'b0000_0000_0000_0000_0100_0111;  //0.00047 radian
//inv_tan[12] = 24'b0000_0000_0000_0000_0010_0010;  //0.00022 radian
//inv_tan[13] = 24'b0000_0000_0000_0000_0001_0010;  //0.00012 radian
//inv_tan[14] = 24'b0000_0000_0000_0000_0000_0101;  //0.00005 radian
//inv_tan[15] = 24'b0000_0000_0000_0000_0000_0010;  //0.00002 radian
//end
//endmodule
//taking value of K=0.8588

module wave_generator #(parameter M=22,N=16, K=24'h0DBD96)
(input signed [N-1:0] theta_in,
input clk,
input rst,
output signed [M-1:0] cos_theta,
output signed [M-1:0] sin_theta);

//Signed number can be defined for 'reg' and 'wire' by 
//using 'signed' keywords i.e. 'reg signed' and 'wire signed' 
//respectively, since the x,y theta values can be negative or positive
//depending on Quadrant

reg signed [M-1:0] x_pipeline[0:N-1];
reg signed [M-1:0] y_pipeline[0:N-1];
reg signed [N-1:0] theta_pipeline[0:N-1];
reg signed [M-1:0] x[0:N];
reg signed [M-1:0] y[0:N];
reg signed [N-1:0] theta[0:N];
reg signed [N-1:0] arcTan[0:N-1];
integer i;

always @(*)
begin
    //store the tan inverse values here, we will compute for 16 iterations
    arcTan[0] = 16'h3B59;
    arcTan[1] = 16'h1F5B;
    arcTan[2] = 16'h0FEB;
    arcTan[3] = 16'h07FD;
    arcTan[4] = 16'h0400;
    arcTan[5] = 16'h0200;
    arcTan[6] = 16'h0100;      
    arcTan[7] = 16'h0080;      
    arcTan[8] = 16'h0040;      
    arcTan[9] = 16'h0020;      
    arcTan[10] = 16'h0010;      
    arcTan[11] = 16'h0008;
    arcTan[12] = 16'h0004;  
    arcTan[13] = 16'h0002;  
    arcTan[14] = 16'h0001; 
    arcTan[15] = 16'h0000;         
end

always @(*)
begin
//initial phasor starting horizontally, ie positioned at (1,0)
//we multiply the precomputed value for 16 iterations, i.e K TO x[0]
//and y[0] is equal to 0
x[0] <= K;
y[0] <= 0;
theta[0] <= theta_in; //input angle for which computation needs to be done

CORDIC_ELEMENT(x[0],y[0],theta[0],arcTan[0],4'd1,x[1],y[1],theta[1]);

for(i=0;i<N-1;i=i+1)
        begin
        CORDIC_ELEMENT(x_pipeline[i],y_pipeline[i],theta_pipeline[i],
        arcTan[i+1],i+2,x[i+2],y[i+2],theta[i+2]);
        end       
end

always @(posedge clk)
begin
for(i=0;i<N-1;i=i+1)
    begin
    x_pipeline[i] <= x[i+1];
    y_pipeline[i] <= y[i+1];
    theta_pipeline[i] <= theta[i+1];
    end
end

assign cos_theta = x_pipeline[N-2];
assign sin_theta = y_pipeline[N-2];

task CORDIC_ELEMENT(
input signed [M-1:0] x_i,
input signed [M-1:0] y_i,
input signed [N-1:0] theta_i,
input signed [N-1:0] delta_theta,
input [3:0]i,
output reg signed [M-1:0] x_out,
output reg signed [M-1:0] y_out,
output reg signed [N-1:0] theta_out
);

reg sigma, sigma_bar;
reg signed [M-1:0] x_input, y_input;
reg signed [M-1:0] x_shifted, y_shifted,x_bar_shifted,y_bar_shifted;
reg signed [N-1:0] Delta_theta_input, Delta_theta_bar;
begin
    sigma = theta_i[N-1]; //sign bit of the angle
    sigma_bar = ~sigma;
    x_shifted = x_i >>> i ; //shift by 2^-i
    y_shifted = y_i >>> i ; //shift by 2^-i
    x_bar_shifted = ~x_shifted + 1;
    y_bar_shifted = ~y_shifted + 1;
    Delta_theta_bar = ~delta_theta +1;
    if((sigma) || (theta_i ==0))
    begin
        x_input = x_bar_shifted; //subtract if sigma is negative
        y_input = y_shifted;    //add if sigma is negative
        Delta_theta_input = delta_theta; //add if sigma is negative
    end
    else
    begin
        x_input = x_shifted;
        y_input = y_bar_shifted;
        Delta_theta_input = Delta_theta_bar;
    end
    
        x_out = x_i + y_input;
        y_out = x_input + y_i;
        theta_out = theta_i + Delta_theta_input;
  end
endtask
endmodule