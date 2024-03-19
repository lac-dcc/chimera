/**
 *
 *
 * @brief Red Pitaya slope detector
 *
 * @Author Marcelo A. Luda
 *
 *  outputs slope value based on 8 data points linear regression.
 *
 * This part of code is written in Verilog hardware description language (HDL).
 * Please visit http://en.wikipedia.org/wiki/Verilog
 * for more details on the language used herein.
 */

 /** Stimation of slope from 9 points
   * The slope is stimated by use of linear least sqaures regression
   * equation reference: https://en.wikipedia.org/wiki/Simple_linear_regression#Linear_regression_without_the_intercept_term
   *
   *         -4*y[n-8]-3*y[n-7]-2*y[n-6]-y[n-5]+y[n-3]+2*y[n-2]+3*y[n-1]+4*y[n]
   * slope = ------------------------------------------------------------------
   *             (-4)^2 + (-3)^2 + (-2)^2 + (-1)^2 + 1^2 + 2^2 + 3^2 + 4^2
   *
   * slope = slope9_dat_o / 60
   *
   * The output value of slope9 is multiplied by 60. To get the actual
   * slope of the set of values you have to divide dat_o by 60 and by the
   * time interval between data points.
   *
   */

module slope9 #(parameter R=15)
(
   // data
   input                         clk             ,  // clock
   input                         rst             ,  // reset - active low
   input                         read_en         ,  // read enable
   input      signed  [  R-1: 0] dat_i           ,  // input data
   output reg signed  [  R-1: 0] dat_o              // output data
);


   wire signed [ R+5-1: 0]  sum ;
   wire signed [   R-1: 0]  sum_div ;


   reg  signed [   R-1: 0] mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7,mem8;
   wire signed [   R-1: 0] mem_next0,mem_next1,mem_next2,mem_next3,mem_next4,mem_next5,mem_next6,mem_next7,mem_next8;


   always @(posedge clk) begin
      if (rst) begin
         mem0  <= {R{1'b0}} ;
         mem1  <= {R{1'b0}} ;
         mem2  <= {R{1'b0}} ;
         mem3  <= {R{1'b0}} ;
         mem4  <= {R{1'b0}} ;
         mem5  <= {R{1'b0}} ;
         mem6  <= {R{1'b0}} ;
         mem7  <= {R{1'b0}} ;
         mem8  <= {R{1'b0}} ;
         dat_o <= {R{1'b0}} ;
      end
      else begin
         mem0  <= mem_next0 ;
         mem1  <= mem_next1 ;
         mem2  <= mem_next2 ;
         mem3  <= mem_next3 ;
         mem4  <= mem_next4 ;
         mem5  <= mem_next5 ;
         mem6  <= mem_next6 ;
         mem7  <= mem_next7 ;
         mem8  <= mem_next8 ;
         dat_o <=   sum_div ;
      end
   end

   // Next-state logic
   assign mem_next0 = read_en ? $signed(dat_i) : mem0  ;
   assign mem_next1 = read_en ? mem0           : mem1  ;
   assign mem_next2 = read_en ? mem1           : mem2  ;
   assign mem_next3 = read_en ? mem2           : mem3  ;
   assign mem_next4 = read_en ? mem3           : mem4  ;
   assign mem_next5 = read_en ?-mem4           : mem5  ;
   assign mem_next6 = read_en ? mem5           : mem6  ;
   assign mem_next7 = read_en ? mem6           : mem7  ;
   assign mem_next8 = read_en ? mem7           : mem8  ;

   // Output
   assign sum = $signed({mem0, 2'b0 }) +                   // error[ 0] *  4
                $signed({mem1, 1'b0 }) + $signed(mem1) +   // error[-1] *  3
                $signed({mem2, 1'b0 }) +                   // error[-2] *  2
                $signed( mem3        ) +                   // error[-3] *  1
                                                           // error[-4] *  0
                $signed( mem5        ) +                   // error[-5] * -1
                $signed({mem6, 1'b0 }) +                   // error[-6] * -2
                $signed({mem7, 1'b0 }) + $signed(mem7) +   // error[-7] * -3
                $signed({mem8, 2'b0 }) ;                   // error[-8] * -4


   assign sum_div = $signed( sum[R-1:0] );

endmodule



/*
Instantiation example:


slope9 #(.R(15)) NAME (.clk(clk),.rst(rst), .read_en( 1'b1 ), .dat_i(  DAT_I  ), .dat_o(  DAT_O  ) );



*/
