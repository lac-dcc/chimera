// This program was cloned from: https://github.com/Motherboard77/CORDIC-2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

//the control unit sets the SR latch to SET value for the first posedge clock
//the input to the SR latch is multiplexed using a 2:1 MUX 
// 
module d_latch(
input d,
input clk,
output reg q);

always@(posedge clk)
    begin
    q = d;
    end
endmodule

module SR_latch(
input s,
//input r,
output wire q
);
wire [2:0] w;
wire r;
not N0(r,s);
    N1(w[0],s);
    N2(w[1],r);
nand N3(q,w[0],w[2]);
nand N4(w[2],q,w[1]);

endmodule


module clock_control_unit(
input clk,
input CON,
output wire out_clk);
reg [1:0] sr_latch_con;
wire d_input;
wire d_output;
always @(CON)
begin
if(CON)
    begin
    sr_latch_con[0] = 1;  //S
    sr_latch_con[1] = 0;  //R
    end
else
    begin
    sr_latch_con[0] = 0;
    sr_latch_con[1] = 1;
    end
end

SR_latch(sr_latch_con[0],sr_latch_con[1],d_input);
d_latch(d_input,clk,d_output);
xor(out_clk,d_output,CON);

endmodule

//drive the d_latch using the master_clock
//drive the CORDIC_ELEMENT using the slave_clock
//1 positive level of the master_clock should accompany 8 0->1 transitions of the //slave_clock
//such that for 1 time period of the master_clock, we get 16 clock cycles(16 iteraitons)
//from the slave_clock, driving the CORDIC_ELEMENT
//slave clock is fed to a clock divider to derive the master clock

//module d_latch_theta(  
//input [15:0] d_theta,
//input clk,
//input enable,
//output reg [15:0] q_theta);

//always@(posedge clk)
//    begin
//      if(enable)
//    	begin    
//    		q_theta = d_theta;
//        end
//    end
//endmodule

//module CORDIC_ELEMENT(
//  input [15:0] x_phasor,    //HAS AN INITIAL VALUE OF K=...
//  input [15:0] y_phasor,    //HAS AN INITIAL VALUE OF 0
//  input [15:0] theta_in,
//  input clk,
//  output [15:0] cos_val,
//  output [15:0] sin_val);
  
//  reg [15:0] arcTan[0:15];  //tan inverse lut
//  reg [29:0] first_quad_x_computed[15:0] ; //16-bit radian value of x(COS)
//  //note that it can store only 30 amplitute levels
//  reg [29:0] first_quad_y_computed[15:0] ; //16-bit radian vlaue of y(SIN)
  
//  reg [15:0] x_computation_temp;  	//to store the previous iteraiton x value
//  reg [15:0] y_computation_temp;  	//to store the previous iteraiton y value
//  reg [15:0] theta_computation_temp;//to store the previous iteraiton theta value
  
//  reg EN; //EN IS enbled depending on the COUNT value . COUNT in turn depends on the clock
//  reg [4:0] count; //counter value increments wrt clk 
  
//  reg [15:0] latched_theta_input;
//  reg [15:0] x_phasor_in;
//  reg [15:0] y_phasor_in;
  
//  initial begin
//    x_phasor_in = x_phasor;
//    y_phasor_in = y_phasor;
//  end
  
//  always @(*)
//    begin
//      //store the arcTan values here
//    end
  
//  //theta_in format should be in radian with fixed point notation
//  //some part of MSB bits are kept reserved for Quadrant check
//  //computation is only done for first quadrant, and computed x and 
//  //y values are stored in a separate LUT
//  //now when the phasor enters the 2nd, 3rd and 4th quadrants, only 
//  //inversion operation need to be pperformed depending on quadrant
//  //number
//  //also, include a D-LATCH in the beginning of the CORDIC ELEMENT, to LATCH the input
//  //i.e theta, and perform 16 iterations on it, then LATCH the next theta value
//  //Also, when the first quadrant computation is done, control should  shift to a second
//  //process, called INVERSION, that perform invesion based on input theta value and 
//  //inverting from the (x,y) LUT.
  

//      //LATCH THE THETA VALUE INSIDE THE CORDIC ELEMENT, DEPENDING ON ENABLE INPUT
//      //d_latch_theta(input d_theta,input clk,input enable,output reg q_theta);
//      d_latch_theta D1(theta_in,clk,EN,latched_theta_input);
     
   
//  always @(posedge clk)
//    begin
//      if(count == 4'b1111)  //16 iterations of theta completed
//        begin
//          EN = 1'b1;        //LATCH the next theta value
//        end
//      else 
//        begin
//          EN = 1'b0; 
//          count = count + 1;
//        end
//    end
  
  
  
  
//endmodule
