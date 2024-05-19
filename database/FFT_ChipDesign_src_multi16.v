// This program was cloned from: https://github.com/VenciFreeman/FFT_ChipDesign
// License: Mozilla Public License 2.0

//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: multi16
//
// Type: Combinatorial
//
// Purpose: The function of this module is to perform decimal arithmetic.
//
// Details: Input and output are both 2's Complements.
//
// Release History:
// - Version 1.0 20/04/09: Create;
// - Version 2.0 20/04/09: Modify;
// - Version 3.0 20/04/12: Transform to a decimal multiplier;
// - Version 3.1 20/04/12: Rewrite always parts;
// - Version 3.2 20/04/12: Add rst_n to the sensitive list;
// - Version 3.3 20/04/12: Fix some errors, compile successful;
// - Version 3.4 20/04/12: Add comments;
// - Version 3.5 20/04/14: Transform to 17-bit input;
// - Version 3.6 20/04/16: Fix some simulation errors;
// - Version 3.7 20/04/16: Simulate successful. Still need to check results;
// - Version 3.8 20/04/17: Check again, fix some errors and add comments;
// - Version 3.9 20/04/17: Fix 2's complement error;
// - Version 4.0 20/04/18: Transform to combinatorial logic;
// - Version 4.1 20/04/19: Fix error, Merge branch from @mikeq123456；
// - Version 4.2 20/04/19: Fix some errors;
// - Version 4.3 20/04/19: Debug finished. No error, function correct;
// - Version 5.0 20/05/03: Rewrite. Change to shift.
//
// Notes: 
//
//**********************************************************

module multi16(

  input  wire [16:0] in_17bit,  // 17-bit input  data
  input  wire [7:0]  in_8bit,   // 8-bit  input  data
  output wire [16:0] out        // 17-bit output data
  
  );

  wire        flag;             // determine the sign of the product
  wire [16:0] in_17bit_b;       // store 17-bit true form data
  wire [7:0]  in_8bit_b;        // store 8-bit  true form data
  wire [24:0] mul;
  wire [16:0] mul_b;
  reg  [24:0] neg_mul;

//**************************** The following are assign statements ****************************

  assign  in_17bit_b = (in_17bit[16] == 1) ? ~in_17bit[16:0] + 1'b1 : in_17bit;  // If in_17bit is a negative number, transform to 2's complement, otherwise remain the same.

  always @ ( in_17bit or in_8bit ) begin
    case ( in_8bit )
      8'b00000000: neg_mul = 25'b0;
      8'b00110001: neg_mul = ( in_17bit_b << 0 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 5 );
      8'b11001111: neg_mul = ( in_17bit_b << 0 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 5 );  
      8'b01011010: neg_mul = ( in_17bit_b << 1 ) + ( in_17bit_b << 3 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 6 ); 
      8'b10100110: neg_mul = ( in_17bit_b << 1 ) + ( in_17bit_b << 3 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 6 );  
      8'b01110110: neg_mul = ( in_17bit_b << 1 ) + ( in_17bit_b << 2 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 5 ) + ( in_17bit_b << 6 ); 
      8'b10001010: neg_mul = ( in_17bit_b << 1 ) + ( in_17bit_b << 2 ) + ( in_17bit_b << 4 ) + ( in_17bit_b << 5 ) + ( in_17bit_b << 6 ); 
      8'b01111111: neg_mul = ( in_17bit_b << 7 );
      8'b10000001: neg_mul = ( in_17bit_b << 7 );
    endcase
  end

//  assign  in_8bit_b  = ( in_8bit[7]  == 1) ?  ~in_8bit[7:0]  + 1'b1 : in_8bit;   // If in_8bit is a negative number, transform to 2's complement, otherwise remain the same.
  assign  flag  = in_17bit[16] + in_8bit[7];                  // Determine the sign of the product. 
//  assign  mul   = in_17bit_b[16:0] * in_8bit_b[7:0];          // Calculate the absolute value of the product.
  assign  mul = neg_mul;
  assign  mul_b = {mul[23:15], mul[14:7]};                    // Shift, combining integer and fractional parts.
  assign  out   = (flag == 1) ? ~mul_b[16:0] + 1'b1 : mul_b;  // Output only keep 17 bits.
  
endmodule
