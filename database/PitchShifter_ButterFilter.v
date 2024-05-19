// This program was cloned from: https://github.com/jmt329/PitchShifter
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
// Sixth order IIR filter //////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module IIR6_32bit_fixed (audio_out, audio_in,
                         scale,
                         b1, b2, b3, b4, b5, b6, b7,
                         a2, a3, a4, a5, a6, a7,
                         clk, data_val, rst, audio_out_val);

   // The filter is a "Direct Form II Transposed"
   //
   //    a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
   //                          - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
   //
   //    If a(1) is not equal to 1, FILTER normalizes the filter
   //    coefficients by a(1).
   //

   // one audio sample, 16 bit, 2's complement
   output reg signed [31:0] audio_out;
   output reg signed        audio_out_val;
   // one audio sample, 16 bit, 2's complement
   input wire signed [31:0] audio_in;
   // shift factor for output
   input wire [2:0]         scale;
   // filter coefficients
   input wire signed [31:0] b1, b2, b3, b4, b5, b6, b7, a2, a3, a4, a5, a6, a7;
   input wire               clk, data_val, rst;

   /// filter vars
   wire signed [31:0]       f1_mac_new, f1_coeff_x_value;
   reg signed [31:0]        f1_coeff, f1_mac_old, f1_value;

   // input to filter
   reg signed [31:0]        x_n;
   // input history x(n-1), x(n-2)
   reg signed [31:0]        x_n1, x_n2, x_n3, x_n4, x_n5, x_n6;

   // output history: y_n is the new filter output, BUT it is
   // immediately stored in f1_y_n1 for the next loop through
   // the filter state machine
   reg signed [31:0]        f1_y_n1, f1_y_n2, f1_y_n3, f1_y_n4, f1_y_n5, f1_y_n6;

   // MAC operation
   signed_mult f1_c_x_v (.out(f1_coeff_x_value), .a(f1_coeff), .b(f1_value));
   assign f1_mac_new = f1_mac_old + f1_coeff_x_value;

   // state variable
   reg [3:0]                state;

   ///////////////////////////////////////////////////////////////////

   //Run the filter state machine FAST so that it completes in one
   //audio cycle
   always @ (posedge clk)
     begin
        if (rst) begin
           state         <= 4'd15; //turn off the state machine
           f1_value      <= 0;
           f1_coeff      <= 0;
           f1_mac_old    <= 0;
           x_n           <= 0;
           x_n1          <= 0;
           x_n2          <= 0;
           x_n3          <= 0;
           x_n4          <= 0;
           x_n5          <= 0;
           x_n6          <= 0;
           f1_y_n1       <= 0;
           f1_y_n2       <= 0;
           f1_y_n3       <= 0;
           f1_y_n4       <= 0;
           f1_y_n5       <= 0;
           f1_y_n6       <= 0;
           audio_out_val <= 0;
        end
        else begin
           case (state)

             1:
               begin
                  // set up b1*x(n)
                  f1_mac_old <= 32'd0;
                  f1_coeff   <= b1;
                  f1_value   <= (audio_in >>> 1);
                  //register input
                  x_n        <= (audio_in >>> 1);
                  // next state
                  state      <= 4'd2;
               end

             2:
               begin
                  // set up b2*x(n-1)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b2;
                  f1_value   <= x_n1;
                  // next state
                  state      <= 4'd3;
               end

             3:
               begin
                  // set up b3*x(n-2)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b3;
                  f1_value   <= x_n2;
                  // next state
                  state      <= 4'd4;
               end

             4:
               begin
                  // set up b4*x(n-3)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b4;
                  f1_value   <= x_n3;
                  // next state
                  state      <= 4'd5;
               end

             5:
               begin
                  // set up b5*x(n-4)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b5;
                  f1_value   <= x_n4;
                  // next state
                  state      <= 4'd6;
               end

             6:
               begin
                  // set up b6*x(n-5)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b6;
                  f1_value   <= x_n5;
                  // next state
                  state      <= 4'd7;

               end

             7:
               begin
                  // set up b7*x(n-6)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= b7;
                  f1_value   <= x_n6;
                  // next state
                  state      <= 4'd8;

               end

             8:
               begin
                  // set up -a2*y(n-1)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a2;
                  f1_value   <= f1_y_n1;
                  //next state
                  state      <= 4'd9;
               end

             9:
               begin
                  // set up -a3*y(n-2)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a3;
                  f1_value   <= f1_y_n2;
                  //next state
                  state      <= 4'd10;
               end

             4'd10:
               begin
                  // set up -a4*y(n-3)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a4;
                  f1_value   <= f1_y_n3;
                  //next state
                  state      <= 4'd11;
               end

             4'd11:
               begin
                  // set up -a5*y(n-4)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a5;
                  f1_value   <= f1_y_n4;
                  //next state
                  state      <= 4'd12;
               end

             4'd12:
               begin
                  // set up -a6*y(n-5)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a6;
                  f1_value   <= f1_y_n5;
                  //next state
                  state      <= 4'd13;
               end

             13:
               begin
                  // set up -a7*y(n-6)
                  f1_mac_old <= f1_mac_new;
                  f1_coeff   <= a7;
                  f1_value   <= f1_y_n6;
                  //next state
                  state      <= 4'd14;
               end

             14:
               begin
                  // get the output
                  // and put it in the LAST output var
                  // for the next pass thru the state machine
                  //mult by four because of coeff scaling
                  // to prevent overflow
                  f1_y_n1 <= f1_mac_new<<scale;

                  audio_out <= f1_y_n1;
                  audio_out_val <= 1'b1;
                  // update output history
                  f1_y_n2 <= f1_y_n1;
                  f1_y_n3 <= f1_y_n2;
                  f1_y_n4 <= f1_y_n3;
                  f1_y_n5 <= f1_y_n4;
                  f1_y_n6 <= f1_y_n5;
                  // update input history
                  x_n1 <= x_n;
                  x_n2 <= x_n1;
                  x_n3 <= x_n2;
                  x_n4 <= x_n3;
                  x_n5 <= x_n4;
                  x_n6 <= x_n5;
                  //next state
                  state <= 4'd15;
               end

             15:
               begin
                  // wait for data valid signal
                  audio_out_val <= 1'b0;
                  if (data_val)
                    begin
                       state <= 4'd1;
                    end
               end

             default:
               begin
                  // default state is end state
                  state <= 4'd15;
               end
           endcase
        end
     end

endmodule

///////////////////////////////////////////////////
//// signed mult of 2.30 format 2'comp ////////////
///////////////////////////////////////////////////
module signed_mult (out, a, b);

   output    [31:0]  out;
   input   signed [31:0] a;
   input   signed [31:0] b;

   wire  signed [31:0]   out;
   wire  signed [63:0]   mult_out;

   assign mult_out = a * b;
   //assign out = mult_out[33:17];
   assign out = {mult_out[63], mult_out[59:30]};
endmodule
//////////////////////////////////////////////////
