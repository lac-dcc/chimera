// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

`define M_W 7
`define EXP_W 8
`define MULT_W `M_W+`M_W+2
`define EXP_MAX 2**(`EXP_W-1)+2**(`EXP_W)-3

//basically a close copy of https://github.com/ReaLLMASIC/nanoGPT/blob/master/HW/SA/verilog/fadd.sv
module fadd
(
    input [16-1:0] a_in, b_in, // Inputs in the format of IEEE-`EXP_W-154 Representation.
    output [16-1:0] result // Outputs in the format of IEEE-`EXP_W-154 Representation.
);

   wire Exception;
   wire output_sign;
   wire operation_sub_addBar;

   wire [16-1:0] operand_a, operand_b;
   wire [`M_W:0] significand_a, significand_b;
   wire [`EXP_W-1:0] exponent_diff;

   wire [`M_W:0] significand_b_add;

   wire [`M_W+1:0] significand_add;
   wire [16-2:0] add_sum;


   //for operations always operand_a must not be less than b_in
   assign {operand_a,operand_b} = (a_in[16-2:0] < b_in[16-2:0]) ? {b_in,a_in} : {a_in,b_in};

   //Exception flag sets 1 if either one of the exponent is 255.
   assign Exception = (&operand_a[16-2:`M_W]) | (&operand_b[16-2:`M_W]);

   assign output_sign = operand_a[16-1] ; // since the operand_a is always greater than operand_b, the sign of the result will be same as operand_a.

   //operation_sub_addBar is 1 if we are doing subtraction else 0.
   assign operation_sub_addBar =  ~(operand_a[16-1] ^ operand_b[16-1]);

   //Assigining significand values according to Hidden Bit.
   assign significand_a = {1'b1,operand_a[`M_W-1:0]}; // expand the mantissa by 1 bit before multiplication since its always implied
   assign significand_b = {1'b1,operand_b[`M_W-1:0]}; // same as above

   //Evaluating Exponent Difference
   assign exponent_diff = operand_a[16-2:`M_W] - operand_b[16-2:`M_W];

   //Shifting significand_b to the right according to exponent_diff. Exapmle: if we have 1.0101 >> 2 = 0.0101 then exponent_diff = 2 and significand_b_add = significand_b >> exponent_diff
   assign significand_b_add = significand_b >> exponent_diff;

   //------------------------------------------------ADD BLOCK------------------------------------------//
   //if we are adding(operation_sub_addBar=1) need to add significand_b_add to significand_a. 
   //Or sets the significand to zero if the signs are different(this means we are doing subtraction), effectively determining the core operation of the floating-point addition based on the sign of the operands.
   assign significand_add = ( operation_sub_addBar) ? (significand_a + significand_b_add) : (significand_a - significand_b_add);  //{(`M_W+2){1'b0}}; 

   //Taking care of the resulting mantissa. 
   //If there is a carry, then the result is normalized by shifting the significand right by one bit(because its implied) and incrementing the exponent by one.
   //If there is no carry, we just use the result of the addition, and we have `M_W-1:0 due to the fact that we are using the hidden bit(implied 1).
   assign add_sum[`M_W-1:0] = significand_add[`M_W+1] ? significand_add[`M_W:1] : significand_add[`M_W-1:0];

   // Taking care of the resulting exponent.
   //If carry generates in sum value then exponent must be added with 1 else feed as it is.
   assign add_sum[16-2:`M_W] = significand_add[`M_W+1] ? (1'b1 + operand_a[16-2:`M_W]) : operand_a[16-2:`M_W];

   assign result = Exception ? {(16){1'b0}} : {output_sign,add_sum};

endmodule


//basically a close copy of https://github.com/ReaLLMASIC/nanoGPT/blob/master/HW/SA/verilog/fmul.sv
module fmul
(
    input [16-1:0] a_in,
    input [16-1:0] b_in,
    output [16-1:0] result
);

    reg [`MULT_W-1:0] mul_fix_out;
    reg [`M_W-1:0] M_result;
    wire [`EXP_W-1:0] e_result;
    wire sign;
    reg [`EXP_W:0] e_result0;
    reg overflow;
    reg zero_check;
    
    // Multiplication logic
    always @* begin
        mul_fix_out = {1'b1, a_in[`M_W-1:0]} * {1'b1, b_in[`M_W-1:0]}; //extend the mantissa by 1 bit before multiplication
    end

    // Zero check
    always @* begin
        if (a_in[16-2:`M_W] == 0 || b_in[16-2:`M_W] == 0) begin
            zero_check = 1'b1;
        end else begin
            zero_check = 1'b0;
        end
    end

    // Generate Mantissa. We are only considering the most significat bits of the product to generate the mantissa.
    always @* begin
        //select two MSBs of the product
        case(mul_fix_out[`MULT_W-1:`MULT_W-2])
           //Example: If mul_fix_out is 8 bits wide and represents 01xxxxxx (binary), it extracts xxxxxx, assuming the MSBs are 01
            2'b01: M_result = mul_fix_out[`MULT_W-3:`M_W]; //MSB is dropped(as it is always 1)
            //In 2'b10 or 2'b11 case: 10yyyyyy → Shift → 0yyyyyy (Extract yyyyyy)
            2'b10: M_result = mul_fix_out[`MULT_W-2:`M_W+1]; // Between two and just under 4. product larger than normalized range, so we need to shift right 
            2'b11: M_result = mul_fix_out[`MULT_W-2:`M_W+1]; // same as line above. 
            default: M_result = mul_fix_out[`MULT_W-2:`M_W+1]; // default same as two lines above
        endcase
    end

    // Overflow check
    always @* begin
        //Different cases for overflow:
        //1. If either of the inputs is zero, then the result is zero and there is no overflow.
        //2. Underflow check: If the sum of the exponents is less than the minimum exponent, then the result is zero and there is no overflow. {2'b0,{(EXP_W-1){1'b1}}} is the minimum exponent(001111111 in case of 32bit float)
        //3. Overflow check: If the sum of the exponents is greater than the maximum exponent, then the result is infinity and there is overflow. EXP_MAX is the maximum exponent.
        overflow = (zero_check || ({1'b0, a_in[16-2:`M_W]} + {1'b0, b_in[16-2:`M_W]} + {{`EXP_W{1'b0}}, mul_fix_out[`MULT_W-1]}) < {2'b0,{(`EXP_W-1){1'b1}}} || ({1'b0, a_in[16-2:`M_W]} + {1'b0, b_in[16-2:`M_W]} + {8'd0, mul_fix_out[`MULT_W-1]}) > `EXP_MAX);

        if (~zero_check) begin
            if (overflow) begin
                e_result0 = {(`EXP_W+1){1'b1}};
            end else begin
                //1. We extend the exponent by 1 bit because the result of addition of two exponents can be 1 bit larger than the exponent itself.
                //2. We add the MSB of the mantissa multiplication(before normalization) to the exponent sum to account for the shifting of the mantissa.
                //3. We subtract the bias from the exponent sum to get the final exponent because just adding two exponents would give us exp1 + exp2 + 2 x bias.
                e_result0 = ({1'b0, a_in[16-2:`M_W]} + {1'b0, b_in[16-2:`M_W]} + {{`EXP_W{1'b0}}, mul_fix_out[`MULT_W-1]}) - {2'b0,{(`EXP_W-1){1'b1}}};
            end
        end else begin
            e_result0 = 0;
        end
    end
    assign e_result = e_result0[`EXP_W-1:0];

    // Sign calculation
    assign sign = a_in[16-1] ^ b_in[16-1];

    wire [`M_W-1:0] overflow_mask;
    assign overflow_mask = overflow ? 0 : {(`M_W){1'b1}};

    assign result = {sign, e_result, overflow_mask & M_result};
endmodule


module itobf16
(
  input  wire signed [15:0] in,
  input  wire               is_signed,
  output reg        [15:0] bf16_out
);

   // First we convert to 32-bit float, then round and truncate to 
   // bfloat16 format since they have the same exponent format.
   reg  [31:0]  pre_round;
   reg  [31:0]  out32;
   reg  [15:0]  sig;
   wire [15:0]  mask;
   reg  [7:0]   exp;
   
   assign mask = 16'hFFFF;

   always @(*)
   begin
      pre_round = 32'h0;
      out32     = 32'h0;
      exp       = 8'h0;
      bf16_out  = 16'h0;

      // If signed, we need the absolute value
      if (is_signed)
         sig = in[15] ? ~in + 1 : in;
      else
         sig = in;
      
      // Test for zero case
      if (in == 0)
      begin
         bf16_out = 16'h0000;
      end
      else
      begin
         integer i;
         exp = 0;
         for (i = 8; i > 0; i = i >> 1)
         begin
            if ((sig & (mask << (16 - i))) == 0)
            begin
               sig = sig << i;
               exp = exp | 8'(i);
            end
         end
            
         // Calculate pre-rounded value
         exp = 142 - exp;
         pre_round = {(is_signed ? in[15] : 1'b0), exp, sig[14:0], 8'h0};

         // Now convert to bfloat16 by rounding and dropping the lower 16 bits
         if (is_signed & in[15])
            out32 = pre_round - 32'h00008000;
         else
            out32 = pre_round + 32'h00008000;

         // Keep the upper 16 bits
         bf16_out = out32[31:16];
      end
   end
endmodule
