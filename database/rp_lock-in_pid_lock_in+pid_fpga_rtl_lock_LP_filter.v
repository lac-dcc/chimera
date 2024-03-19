`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2017 12:03:25
// Design Name: 
// Module Name: LP_filter
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


module LP_filter #(parameter R=14, RT=5)
    (
    input clk,rst,
    input         [RT-1:0] tau,
    input  signed [ R-1:0] in,
    output signed [ R-1:0] out
    );
    
    // R resolution of input and output signals
    // Low Pass Filter characteristi time is: 8 ns * 2**tau
    // max tau value = 49-R . For R=14, max tau=35
    //                        For R=28, max tau=21
    
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
    assign sum_div  =  $signed( sum[S-1:0] ) >>> tau ;
    //assign out      =  sum_div[R-1:0] ;
    satprotect #(.Ri(S-6),.Ro(R),.SAT(R)) i_satprotect ( .in(sum_div), .out(out) );
    
endmodule


/*
LP_filter #(.R(28)) NAME (.clk(clk),.rst(rst), .tau( 14'd18   ), .in(  IN  ),.out(  OUT  ) );
LP_filter #(.R(14)) NAME (.clk(clk),.rst(rst), .tau( 14'd18   ), .in(  IN  ),.out(  OUT  ) );
*/


/** Values of tau
  *   | num  |     tau     |     freq     |
  *   |   0  |    8.00 ns  |   19.89 MHz  |
  *   |   1  |   16.00 ns  |    9.95 MHz  |
  *   |   2  |   32.00 ns  |    4.97 MHz  |
  *   |   3  |   64.00 ns  |    2.49 MHz  |
  *   |   4  |  128.00 ns  |    1.24 MHz  |
  *   |   5  |  256.00 ns  |  621.70 kHz  |
  *   |   6  |  512.00 ns  |  310.85 kHz  |
  *   |   7  |    1.02 us  |  155.42 kHz  |
  *   |   8  |    2.05 us  |   77.71 kHz  |
  *   |   9  |    4.10 us  |   38.86 kHz  |
  *   |  10  |    8.19 us  |   19.43 kHz  |
  *   |  11  |   16.38 us  |    9.71 kHz  |
  *   |  12  |   32.77 us  |    4.86 kHz  |
  *   |  13  |   65.54 us  |    2.43 kHz  |
  *   |  14  |  131.07 us  |    1.21 kHz  |
  *   |  15  |  262.14 us  |  607.13  Hz  |
  *   |  16  |  524.29 us  |  303.56  Hz  |
  *   |  17  |    1.05 ms  |  151.78  Hz  |
  *   |  18  |    2.10 ms  |   75.89  Hz  |
  *   |  19  |    4.19 ms  |   37.95  Hz  |
  *   |  20  |    8.39 ms  |   18.97  Hz  |
  *   |  21  |   16.78 ms  |    9.49  Hz  |
  ----------------------------------------------------------- 28
  *   |  22  |   33.55 ms  |    4.74  Hz  |
  *   |  23  |   67.11 ms  |    2.37  Hz  |
  *   |  24  |  134.22 ms  |    1.19  Hz  |
  *   |  25  |  268.44 ms  |  592.90 mHz  |
  *   |  26  |  536.87 ms  |  296.45 mHz  |
  *   |  27  |    1.07  s  |  148.22 mHz  |
  *   |  28  |    2.15  s  |   74.11 mHz  |
  *   |  29  |    4.29  s  |   37.06 mHz  |
  *   |  30  |    8.59  s  |   18.53 mHz  |
  *   |  31  |   17.18  s  |    9.26 mHz  |
  *   |  32  |   34.36  s  |    4.63 mHz  |xx
  *   |  33  |   68.72  s  |    2.32 mHz  |
  *   |  34  |  137.44  s  |    1.16 mHz  |
  *   |  35  |  274.88  s  |  579.00 uHz  |
  ----------------------------------------------------------- 14
  *   |  36  |  549.76  s  |  289.50 uHz  |
  *   |  37  |    1.10 ks  |  144.75 uHz  |
  *   |  38  |    2.20 ks  |   72.38 uHz  |
  *   |  39  |    4.40 ks  |   36.19 uHz  |
  *   |  40  |    8.80 ks  |   18.09 uHz  |
  *   |  41  |   17.59 ks  |    9.05 uHz  |
  *   |  42  |   35.18 ks  |    4.52 uHz  |
  *   |  43  |   70.37 ks  |    2.26 uHz  |
  *   |  44  |  140.74 ks  |    1.13 uHz  |
  *   |  45  |  281.47 ks  |  565.43 nHz  |
  *   |  46  |  562.95 ks  |  282.72 nHz  |
  *   |  47  |    1.13 Ms  |  141.36 nHz  |
  -----------------------------------------------------------
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

for i in arange(48):
    tau =8e-9 * 2**(i)
    oom =floor(log10(tau)/3).astype(int)
    val =tau/10**(3*oom)
    freq=1/(2*pi*tau)
    foom=floor(log10(freq)/3).astype(int)
    fval=freq/10**(3*foom)
    print('  *   |  {:>2d}  |  {:6.2f} {:s}s  '.format(i,val,units[oom])+
          '|  {:6.2f} {:s}Hz  |'.format(fval,units[foom]))
print('  *')

*/
