// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0


`define SIGN 26
`define EXP 25:18
`define MANT 17:0


module FpAdd (
              clk,             // replace string with clock
              in1,          // replace string with fp_in1
              in2,          // replace string with fp_in2
              sum,          // replace string with fp_sum
              rst
              );

   //--------------------------------------------------------------------
   // Inputs
   //--------------------------------------------------------------------
   input wire clk;
   input wire [26:0] in1;
   input wire [26:0] in2;
   input wire        rst;
   
   //--------------------------------------------------------------------
   // Outputs
   //--------------------------------------------------------------------
   output reg [26:0] sum;

   //--------------------------------------------------------------------
   // Internals
   //--------------------------------------------------------------------
   parameter sign = 26;
   parameter ex_end = 25;
   parameter ex_st = 18;
   parameter ma_end = 17;
   parameter ma_st = 0;

   //--------------------------------------------------------------------
   // First Stage
   //--------------------------------------------------------------------
   
   //--------------------------------------------------------------------
   // Finding greater number among the 2
   //--------------------------------------------------------------------
   reg [`SIGN:0] greater;
   reg [`SIGN:0] smaller;

   always @(*)
     begin
        if (in1[`EXP] > in2[`EXP])
          begin
             greater <= in1;
             smaller <= in2;
          end
        else
          if (in1[`EXP] == in2[`EXP] && in1[`MANT] > in2[`MANT])
            begin
               greater <= in1;
               smaller <= in2;
            end
          else
            begin
               greater <= in2;
               smaller <= in1;
            end
     end // always @ (*)
   
   
   //--------------------------------------------------------------------
   // Net smaller value for arithmetic
   //--------------------------------------------------------------------
   reg [18:0] net_small;
   wire [`EXP] small_shift;
   
   assign small_shift = greater[`EXP] - smaller[`EXP];
   
   always @(*)
     begin
        if (greater[`EXP] - smaller[`EXP] <= 5'd18)
          begin
             net_small <= {1'b1,smaller[`MANT]} >> (small_shift);
          end
        else
          begin
             net_small <= 'b0;
          end
     end // always @ (*)


   //--------------------------------------------------------------------
   // Pipeline Register's
   //--------------------------------------------------------------------
   reg [`SIGN:0] gr;
   reg [19:0] sm;
   reg [`EXP]    net_expt;
   reg [`EXP]    sm_shift;
   
   always @(posedge clk or negedge rst)
     begin
        if (rst == 'b0)
          begin
             gr <= 'b0;
             sm <= 'b0;
             net_expt <= 'b0;
             sm_shift <= 'b0;
          end 
        else
           begin
             gr <= greater;
             sm <= {smaller[`SIGN],net_small}; // check for sm
             net_expt <= greater[`EXP];
             sm_shift <= small_shift;
          end    
     end

   
   //--------------------------------------------------------------------
   // Second Stage
   //--------------------------------------------------------------------
   
   //--------------------------------------------------------------------
   // Deciding Addition or Subtraction
   //--------------------------------------------------------------------
   wire sub;
   assign sub = (gr[`SIGN] ^ sm[19]);
   

   //--------------------------------------------------------------------
   // Addition
   //--------------------------------------------------------------------
   
   //--------------------------------------------------------------------
   // Addition Output
   //--------------------------------------------------------------------
   reg [19:0] add_out;
   
   always @(*)
      begin
         add_out <= ({1'b1,gr[`MANT]} + {sm[18:0]});
      end


   //--------------------------------------------------------------------
   // net exponent adder if carry generated in addition
   //--------------------------------------------------------------------
   reg [`EXP] expt_carry;

   always @(*)
     begin
        expt_carry <= net_expt + {7'b0,add_out[19]};
     end


   //--------------------------------------------------------------------
   // result from the whole flow if sign bits of both numbers are equal
   // i.e addition of their magnitudes
   //--------------------------------------------------------------------
   reg [26:0] add_result;
   
   wire [17:0] final_add = (add_out[19]) ? 
               {add_out[18:1]} : add_out[17:0];
   

   always @(*)
     begin
        add_result <= {gr[`SIGN],expt_carry,final_add};
     end // always @ (*)

   
   //--------------------------------------------------------------------
   // Subtraction
   //--------------------------------------------------------------------
   
   //--------------------------------------------------------------------
   // Subtraction Output
   //--------------------------------------------------------------------
   reg [18:0] sub_out;

   always @(*)
     begin
        sub_out <= {1'b1,gr[`MANT]} - sm[18:0];
     end

   //--------------------------------------------------------------------
   // Exponent Difference after subtraction Generator
   //--------------------------------------------------------------------
   reg [4:0] sub_shift;
      always @(*)
     begin
        casex (sub_out)
          19'b1XXXXXXXXXXXXXXXXXX: sub_shift <= 5'd0;
          19'b01XXXXXXXXXXXXXXXXX: sub_shift <= 5'd1;
          19'b001XXXXXXXXXXXXXXXX: sub_shift <= 5'd2;
          19'b0001XXXXXXXXXXXXXXX: sub_shift <= 5'd3;
          19'b00001XXXXXXXXXXXXXX: sub_shift <= 5'd4;
          19'b000001XXXXXXXXXXXXX: sub_shift <= 5'd5;
          19'b0000001XXXXXXXXXXXX: sub_shift <= 5'd6;
          19'b00000001XXXXXXXXXXX: sub_shift <= 5'd7;
          19'b000000001XXXXXXXXXX: sub_shift <= 5'd8;
          19'b0000000001XXXXXXXXX: sub_shift <= 5'd9;
          19'b00000000001XXXXXXXX: sub_shift <= 5'd10;
          19'b000000000001XXXXXXX: sub_shift <= 5'd11;
          19'b0000000000001XXXXXX: sub_shift <= 5'd12;
          19'b00000000000001XXXXX: sub_shift <= 5'd13;
          19'b000000000000001XXXX: sub_shift <= 5'd14;
          19'b0000000000000001XXX: sub_shift <= 5'd15;
          19'b00000000000000001XX: sub_shift <= 5'd16;
          19'b000000000000000001X: sub_shift <= 5'd17;
          19'b0000000000000000001: sub_shift <= 5'd18;
          19'b0000000000000000000: sub_shift <= 5'd19;
          default:                sub_shift <= 5'd0;
        endcase
     end // always @ (*)

  
   //--------------------------------------------------------------------
   // Calculating net exponent
   //--------------------------------------------------------------------
   reg [7:0] sub_expt;
   
   always @(*)
     begin
        sub_expt <= net_expt - {3'b0,sub_shift};
     end
   

   //--------------------------------------------------------------------
   // Calculating Final Subtraction Out after shift
   //--------------------------------------------------------------------
   reg [17:0] final_sub;
   reg [18:0] temp_sub;
   always @(*)
     begin
        temp_sub <= (sub_out << sub_shift);
        final_sub <= temp_sub[17:0];
     end
   //--------------------------------------------------------------------
   // Calculating Final Subtraction Result
   //--------------------------------------------------------------------
   reg [26:0] sub_result;

   always @(*)
     begin
        sub_result <= {gr[`SIGN],sub_expt,final_sub};
     end

   //--------------------------------------------------------------------
   // Calculating Final Subtraction Result
   //--------------------------------------------------------------------
   always @(*)
     begin
        if (sub)
          begin
             sum <= sub_result;
          end
        else
          begin
             sum <= add_result;
          end
     end

   //--------------------------------------------------------------------
   // Test code (not part of the RTL)
   //--------------------------------------------------------------------
   // always @(*)
   //   begin
   //      sum <= add_result;
   //  end
   wire [18:0] sm_mant = sm[18:0];
   wire [18:0] gr_mant = {1'b1,gr[`MANT]};
   
endmodule
   
   
