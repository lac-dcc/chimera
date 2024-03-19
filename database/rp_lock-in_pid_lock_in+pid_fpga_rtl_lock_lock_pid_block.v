/**
 * $Id: red_pitaya_pid_block.v 961 2014-01-21 11:40:39Z matej.oblak $
 *
 * Based on "Red Pitaya PID controller".
 *
 * This part of code is written in Verilog hardware description language (HDL).
 * Please visit http://en.wikipedia.org/wiki/Verilog
 * for more details on the language used herein.
 */



/**
 * GENERAL DESCRIPTION:
 *
 * Proportional-integral-derivative (PID) controller.
 *
 *
 *        /---\         /---\      /-----------\
 *   IN --| - |----+--> | P | ---> | SUM & SAT | ---> OUT
 *        \---/    |    \---/      \-----------/
 *          ^      |                   ^  ^
 *          |      |    /---\          |  |
 *   set ----      +--> | I | ---------   |
 *   point         |    \---/             |
 *                 |                      |
 *                 |    /---\             |
 *                 ---> | D | ------------
 *                      \---/
 *
 *
 * Proportional-integral-derivative (PID) controller is made from three parts.
 *
 * Error which is difference between set point and input signal is driven into
 * propotional, integral and derivative part. Each calculates its own value which
 * is then summed and saturated before given to output.
 *
 * Integral part has also separate input to reset integrator value to 0.
 *
 */




module lock_pid_block
(
   // data
   input                     clk_i           ,  // clock
   input                     rstn_i          ,  // reset integrator memory
   input                     pid_freeze      ,  // freeze output value
   input                     pid_ifreeze     ,  // freeze integrator memory value
   input  signed  [ 14-1: 0] dat_i           ,  // input data
   input          [ 14-1: 0] sat_i           ,  // input data
   output signed  [ 14-1: 0] dat_o           ,  // output data

   // DIV settings

   input          [  3-1: 0] PSR             ,  // PSR for proportional
   input          [  4-1: 0] ISR             ,  // ISR for Integration
   input          [  3-1: 0] DSR             ,  // DSR for Derivative

   // settings
   input signed   [ 14-1: 0] set_sp_i        ,  // set point
   input signed   [ 14-1: 0] set_kp_i        ,  // Kp
   input signed   [ 14-1: 0] set_ki_i        ,  // Ki
   input signed   [ 14-1: 0] set_kd_i        ,  // Kd
   input                     int_rst_i          // integrator reset
);

/*
localparam PSR=10;
localparam ISR=26;
localparam DSR=10;
*/


/*

Modo de uso

set_sp_i
set_kp_i  --> kp_reg
set_ki_i  --> int_shr
set_kd_i  --> kd_reg_s

PSR  12
ISR  18
DSR  10


Proporcional:
kp_reg =error * set_kp_i / 2**PSR

Integrador
int_shr = int_reg / 2**ISR
int_reg = int_reg + error * set_ki_i

Derivador:
kd_reg_s = kd_reg - kd_reg_r
kd_reg = error * set_kd_i / 2**DSR
kd_reg_r es el del tick de clk anterior

*/


//---------------------------------------------------------------------------------
//  Set point error calculation

reg signed [ 15-1: 0] error        ;

always @(posedge clk_i) begin
   if (rstn_i == 1'b1) begin
      error <= 15'h0 ;
   end
   else begin
      error <= $signed(set_sp_i) - $signed(dat_i) ;
   end
end








//---------------------------------------------------------------------------------
//  Proportional part

reg  signed [    28-1: 0] kp_reg          ;   // error * kp / 2**PSR   ---> THIS GOES TO PID OUT
wire signed [    28-1: 0] kp_mult         ;   // error * kp

always @(posedge clk_i) begin
   if (rstn_i == 1'b1) begin
      kp_reg  <= 28'b0 ;
   end
   else begin
      case (PSR)
         3'd0     : begin kp_reg <= kp_mult;                                       end
         3'd1     : begin kp_reg <= {  {3{kp_mult[28-1]}} , kp_mult[28-1 :  3]};   end
         3'd2     : begin kp_reg <= {  {6{kp_mult[28-1]}} , kp_mult[28-1 :  6]};   end
         3'd3     : begin kp_reg <= { {10{kp_mult[28-1]}} , kp_mult[28-1 : 10]};   end
         3'd4     : begin kp_reg <= { {12{kp_mult[28-1]}} , kp_mult[28-1 : 12]};   end
         default  : begin kp_reg <= kp_mult;                                       end
      endcase
   end
end

assign kp_mult = $signed(error) * $signed(set_kp_i);


//---------------------------------------------------------------------------------
//  Integrator

reg          [    8-1: 0] sat_int       ;      // Saturation control
reg   signed [   29-1: 0] ki_mult       ;      // error * ki
wire  signed [   64-1: 0] int_sum,int_sum_sat; // error * ki + Memory
reg   signed [   63-1: 0] int_reg       ;      // Memory
wire  signed [   63-1: 0] int_shr       ;      // Memory / 2**ISR  ---> THIS GOES TO PID OUT
reg   signed [   63-1: 0] int_shr_reg   ;      // Memory aux
//reg          [    5-1: 0] ISR_sat       ;      // Saturation aux

//wire  signed [   47-1: 0] int_shr1       ;      //

always @(posedge clk_i) begin
   if (rstn_i == 1'b1) begin
      ki_mult     <= 29'b0;
      int_reg     <= 63'b0;
      int_shr_reg <= 63'b0;
      sat_int     <=  8'b0;
   end
   else begin
      if (pid_ifreeze)
         ki_mult <= 29'b0 ;
      else
         ki_mult <= $signed(error) * $signed(set_ki_i) ;

      if (int_rst_i)
         begin
            int_reg     <= 63'h0; // reset
            int_shr_reg <= 63'h0; // reset
            sat_int     <=  8'b0;
         end
      else
         begin
            int_reg     <= int_sum_sat[63-1: 0];
            case (ISR)
               4'd0     : begin int_shr_reg <= int_sum_sat[63-1: 0];                               sat_int <= sat_i[8-1:0]+ 5'd0  ;        end
               4'd1     : begin int_shr_reg <= {  {3{int_sum_sat[63-1]}} , int_sum_sat[63-1:3] };  sat_int <= sat_i[8-1:0]+ 5'd3  ;        end
               4'd2     : begin int_shr_reg <= {  {6{int_sum_sat[63-1]}} , int_sum_sat[63-1:6] };  sat_int <= sat_i[8-1:0]+ 5'd6  ;        end
               4'd3     : begin int_shr_reg <= { {10{int_sum_sat[63-1]}} , int_sum_sat[63-1:10]};  sat_int <= sat_i[8-1:0]+ 5'd10 ;        end
               4'd4     : begin int_shr_reg <= { {13{int_sum_sat[63-1]}} , int_sum_sat[63-1:13]};  sat_int <= sat_i[8-1:0]+ 5'd13 ;        end
               4'd5     : begin int_shr_reg <= { {16{int_sum_sat[63-1]}} , int_sum_sat[63-1:16]};  sat_int <= sat_i[8-1:0]+ 5'd16 ;        end
               4'd6     : begin int_shr_reg <= { {20{int_sum_sat[63-1]}} , int_sum_sat[63-1:20]};  sat_int <= sat_i[8-1:0]+ 5'd20 ;        end
               4'd7     : begin int_shr_reg <= { {23{int_sum_sat[63-1]}} , int_sum_sat[63-1:23]};  sat_int <= sat_i[8-1:0]+ 5'd23 ;        end
               4'd8     : begin int_shr_reg <= { {26{int_sum_sat[63-1]}} , int_sum_sat[63-1:26]};  sat_int <= sat_i[8-1:0]+ 5'd26 ;        end
               4'd9     : begin int_shr_reg <= { {30{int_sum_sat[63-1]}} , int_sum_sat[63-1:30]};  sat_int <= sat_i[8-1:0]+ 5'd30 ;        end
               default  : begin int_shr_reg <= int_sum_sat[63-1: 0] ;                              sat_int <= sat_i[8-1:0]+ 5'd0  ;        end
            endcase
         end
   end
end

assign int_sum     = $signed(ki_mult) + $signed(int_reg) ;
assign int_shr     = int_shr_reg ;


sat14 #(.RES(64)) i_sat14_int ( .in(int_sum), .lim( { 56'b0 , sat_int }  ), .out(int_sum_sat) );







//---------------------------------------------------------------------------------
//  Derivative


wire signed [    15-1: 0] error_slope       ;   // slope calculated form 9 points interpolation
wire signed [    29-1: 0] kd_mult           ;   // error_slope * kd
reg  signed [    29-1: 0] kd_reg            ;   // error * kd / 2**DSR

reg  signed [    15-1: 0] error_smooth      ;   // time step
reg  signed [    31-1: 0] mem_smooth        ;   // time step
reg         [    16-1: 0] cnt_smooth        ;   // counter
reg                       read_en           ;
//wire signed [    15-1: 0] error_smooth_next      ;   // time step
wire signed [    32-1: 0] mem_smooth_next        ;   // time step
wire        [    17-1: 0] cnt_smooth_next        ;   // counter


always @(posedge clk_i) begin
      if (rstn_i) begin
         error_smooth   <= 15'b0 ;
         read_en        <=  1'b0 ;
         kd_reg         <= 29'b0 ;
         mem_smooth     <= 15'b0 ;
         cnt_smooth     <= 16'b0 ;
      end
      else begin
         case (DSR)
            3'd0     : begin error_smooth <= mem_smooth_next[15-1: 0];  read_en <= 1'b1 ;           end
            3'd1     : begin error_smooth <= mem_smooth_next[18-1: 3];  read_en <= cnt_smooth_next[ 3];  end
            3'd2     : begin error_smooth <= mem_smooth_next[21-1: 6];  read_en <= cnt_smooth_next[ 6];  end
            3'd3     : begin error_smooth <= mem_smooth_next[25-1:10];  read_en <= cnt_smooth_next[10];  end
            3'd4     : begin error_smooth <= mem_smooth_next[28-1:13];  read_en <= cnt_smooth_next[13];  end
            3'd5     : begin error_smooth <= mem_smooth_next[31-1:16];  read_en <= cnt_smooth_next[16];  end
            default  : begin error_smooth <= mem_smooth_next[15-1: 0];  read_en <= 1'b1 ;           end
         endcase
         kd_reg         <= { {6{kd_mult[29-1]}} , kd_mult[29-1: 6] };  // division by 64, to compensate the 60 factor of slope9 module
         mem_smooth     <= mem_smooth_next[31-1:0]    ;
         cnt_smooth     <= cnt_smooth_next[16-1:0 ]    ;
         //error_smooth   <= error_smooth_next  ;

      end
   end

// Next-state logic
assign mem_smooth_next   =  read_en ? error : mem_smooth + error;
assign cnt_smooth_next   =  read_en ? 16'b0 : cnt_smooth + 1'b1 ;


slope9 #(.R(15)) i_slope9 (.clk(clk_i),.rst(rstn_i), .read_en( read_en ), .dat_i(  error_smooth  ), .dat_o(  error_slope  ) );


assign kd_mult       = $signed(error_slope[15-1:0]) * $signed(set_kd_i) ;


//---------------------------------------------------------------------------------
//  Sum together - saturate output
wire signed [   64-1: 0] pid_sum     ; // biggest posible bit-width
//wire signed [   64-1: 0] pid_out     ;
wire signed [   14-1: 0] pid_out     ;

assign pid_sum = $signed(kp_reg) + $signed(int_shr) + $signed(kd_reg) ;

//sat14 #(.RES(64)) i_sat14_pid_sum ( .in(pid_sum), .lim(64'd13), .out(pid_out) );
satprotect #(.Ri(64),.Ro(14),.SAT(14)) i_satprotect_pid_sum ( .in(pid_sum), .out(pid_out) );


reg  signed  [ 14-1: 0] dat_o_mem ;
wire signed  [ 14-1: 0] dat_o_mem_next ;


always @(posedge clk_i)
      if (rstn_i)
         dat_o_mem      <= 14'b0 ;
      else
         dat_o_mem      <= dat_o_mem_next;

assign dat_o_mem_next = pid_freeze ? dat_o_mem : $signed(pid_out[ 14-1: 0]) ;


//assign dat_o = $signed(pid_out[ 14-1: 0]) ;
assign dat_o = dat_o_mem_next ;


endmodule



/*
Instantiation example:

lock_pid_block NAME (
   // data
  .clk_i        (  clk            ),  // clock
  .rstn_i       (  rst            ),  // reset - active low
  .dat_i        (  outBin         ),  // input data
  .sat_i        (  satB           ),  // saturacion
  .dat_o        (  Bout           ),  // output data

   // settings
  .PSR          (  3'd10    ),
  .ISR          (  4'd26    ),
  .DSR          (  3'd10    ),
  .set_sp_i     (  Bsp      ),  // set point
  .set_kp_i     (  Bkp      ),  // Kp
  .set_ki_i     (  Bki      ),  // Ki
  .set_kd_i     (  Bkd      ),  // Kd
  .int_rst_i    (  Brst     )   // integrator reset
);


*/
