`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2017 12:03:25
// Design Name: 
// Module Name: LP_filter2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LP_filter2 #(parameter R=14)
    (
    input clk,rst,
    input         [ 6-1:0] tau,
    input  signed [ R-1:0] in,
    output signed [ R-1:0] out
    );
    
    // R resolution of input and output signals
    // Low Pass Filter characteristi time is: 8 ns * 2**tau
    // max tau value = 62-R . For R=14, max tau=48
    //                        For R=28, max tau=34
    
    localparam S=49; // 39 works great
    
    reg  signed [S-1  :0] sum;
    wire signed [S    :0] sum_next;
    wire signed [S-6-1:0] sum_div;
    
    always @(posedge clk) begin
       if (rst) begin
           sum    <=    {S{1'b0}}    ;
        end 
        else begin
           if ( sum_next[S:S-1] == 2'b01  )  // positive overflow 
              sum    <=  {1'b0, {S-1{1'b1}} } ;
           else if ( sum_next[S:S-1] == 2'b10  )  // negative overflow 
              sum    <=  {1'b1, {S-1{1'b0}} } ;
           else
              sum    <=  sum_next[S-1:0] ;
        end
    end
    
    assign sum_next =  $signed(in)  - $signed( sum_div ) + $signed(sum)  ;
    assign sum_div =  $signed( sum[S-1:6] ) >>> tau[4-1:0] ;
    //assign sum_div  =  { {6{sum_div1[57-1]}} , $signed( sum_div1 ) >>> tau[5-1:0] } ;
    
    //assign out = sum_div[R-1:0] ;
    assign out = ( |tau[5:4] ) ? in : sum_div[R-1:0] ;
    
endmodule


/*
LP_filter2 #(.R(28)) NAME (.clk(clk),.rst(rst), .tau( 14'd18   ), .in(  IN  ),.out(  OUT  ) );
LP_filter2 #(.R(14)) NAME (.clk(clk),.rst(rst), .tau( 14'd18   ), .in(  IN  ),.out(  OUT  ) );
*/


/** Values of tau
  *   | num  |     tau     |     freq     |
  *   |   0  |  512.00 ns  |  310.85 kHz  |
  *   |   1  |    1.02 us  |  155.42 kHz  |
  *   |   2  |    2.05 us  |   77.71 kHz  |
  *   |   3  |    4.10 us  |   38.86 kHz  |
  *   |   4  |    8.19 us  |   19.43 kHz  |
  *   |   5  |   16.38 us  |    9.71 kHz  |
  *   |   6  |   32.77 us  |    4.86 kHz  |
  *   |   7  |   65.54 us  |    2.43 kHz  |
  *   |   8  |  131.07 us  |    1.21 kHz  |
  *   |   9  |  262.14 us  |  607.13  Hz  |
  *   |  10  |  524.29 us  |  303.56  Hz  |
  *   |  11  |    1.05 ms  |  151.78  Hz  |
  *   |  12  |    2.10 ms  |   75.89  Hz  |
  *   |  13  |    4.19 ms  |   37.95  Hz  |
  *   |  14  |    8.39 ms  |   18.97  Hz  |
  *   |  15  |   16.78 ms  |    9.49  Hz  |
  *
  */
  


/*
from numpy import *
import matplotlib.pyplot as plt


N=arange(41)

tau=8e-9 * 2**N

units={ -3: 'n', 
        -2: 'u',
        -1: 'm',
         0: ' ',
         1: 'k',
         2: 'M',
         3: 'G'
        }

print('/** Values of tau')
print('  *   | num  |     tau     |     freq     |')

for i in arange(16):
    tau =8e-9 * 2**(i+6)
    oom =floor(log10(tau)/3).astype(int)
    val =tau/10**(3*oom)
    freq=1/(2*pi*tau)
    foom=floor(log10(freq)/3).astype(int)
    fval=freq/10**(3*foom)
    print('  *   |  {:>2d}  |  {:6.2f} {:s}s  '.format(i,val,units[oom])+
          '|  {:6.2f} {:s}Hz  |'.format(fval,units[foom]))
print('  *')

*/
