//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly
//
// Type: Combinatorial
//
// Purpose: Butterfly computation for 16-bit 4-radix FFT.
//
// Details: 
// - Get calc_in signal from s_p, as input data for butterfly operation;
// - Get rotation signal from ctrl, as a parameter to select the rotation factor;
// - Every butterfly operation (8 in total) has 3 rotation factors. Selection via state machine;
// - Split complex addition into real multiplication and addition and subtraction.
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/03/20: Modify;
// - Version 1.2 20/04/06: Modify the multiply method;
// - Version 1.3 20/04/07: Add state machine；
// - Version 1.4 20/04/09: Rewrite multiply commands. Still many things need to rewrite;
// - Version 1.5 20/04/12: Use decimal multiplier;
// - Version 1.6 20/04/12: Use non-blocking assignment, transform to sequential;
// - Version 1.7 20/04/12: Edit decimal multiplier, rewrite wire/reg;
// - Version 2.0 20/04/12: Fix some errors, compile successful;
// - Version 2.1 20/04/12: Optimize layout, change to 2's complement and add notes;
// - Version 2.2 20/04/14: Update rotation factors;
// - Version 2.3 20/04/16: Fix some simulation errors;
// - Version 2.4 20/04/16: Fix some errors about bits;
// - Version 2.5 20/04/16: Simulate successful. Still need to check results;
// - Version 2.6 20/04/17: Check again, fix some errors. Simulate successful;
// - Version 2.7 20/04/17: Add signed;
// - Version 2.8 20/04/18: Check again, add comments;
// - Version 2.9 20/04/18: Fix rotation factors;
// - Version 3.0 20/04/18: Transform to combinatorial logic;
// - Version 3.1 20/04/18: Merge branch from @mikeq123456;
// - Version 3.2 20/04/19: Debug finished. No error, function correct.
//
// Notes:
// - rotation_factor format: (Re,Im). The highest bit is sign bit, 7 data bits;
// - calc_in format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im);
// - Input and output are both 2's Complements;
// - Subsequent optimization can simplify complex multiplication operations, or can also improve 
// - the multiplier, and can optimize the rotation factor to improve accuracy.
//
//**********************************************************

module butterfly(
  input  wire [135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire [2:0]   rotation, // Number of each butterfly computation (8 in total)
  output wire [135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)
  );

  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b00110001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) 0.0110000111111000101000001001000000101101111000000001
  parameter parn3827 = 8'b11001111;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8) 0.1011010100000100100000010110111100000000011010001110
  parameter parn7071 = 8'b10100110;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) 0.1110110010000100101101011101110011000110001111110001
  parameter parn9239 = 8'b10001010;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = cos(0pi/8) = - cos(8pi/8)
  parameter parn1111 = 8'b10000001;  // -1.0000.
  
  reg  signed [7:0]  rotation_factor1_real;  // For input B
  reg  signed [7:0]  rotation_factor1_imag;  // For input B
  reg  signed [7:0]  rotation_factor2_real;  // For input C
  reg  signed [7:0]  rotation_factor2_imag;  // For input C
  reg  signed [7:0]  rotation_factor3_real;  // For input D
  reg  signed [7:0]  rotation_factor3_imag;  // For input D

  wire signed [7:0]  in_8bit_1_real, in_8bit_1_imag;
  wire signed [7:0]  in_8bit_2_real, in_8bit_2_imag;
  wire signed [7:0]  in_8bit_3_real, in_8bit_3_imag;

  wire signed [33:0] temp_0, temp_1, temp_2, temp_3;

  wire signed [16:0] temp_0_real, temp_0_imag;
  wire signed [16:0] temp_1_real, temp_1_imag;
  wire signed [16:0] temp_2_real, temp_2_imag;
  wire signed [16:0] temp_3_real, temp_3_imag;

  wire signed [16:0] in_17bit_0_real, in_17bit_0_imag;
  wire signed [16:0] in_17bit_1_real, in_17bit_1_imag;
  wire signed [16:0] in_17bit_2_real, in_17bit_2_imag;
  wire signed [16:0] in_17bit_3_real, in_17bit_3_imag;

  wire signed [16:0] out_0_real, out_0_imag;
  wire signed [16:0] out_1_real, out_1_imag;
  wire signed [16:0] out_2_real, out_2_imag;
  wire signed [16:0] out_3_real, out_3_imag;

  wire signed [16:0] temp_2_1_real, temp_2_2_real, temp_2_1_imag, temp_2_2_imag;
  wire signed [16:0] temp_3_1_real, temp_3_2_real, temp_3_1_imag, temp_3_2_imag;
  wire signed [16:0] temp_4_1_real, temp_4_2_real, temp_4_1_imag, temp_4_2_imag;

//****************************** The following are state machines *****************************

// This always part controls signal rotation_factor1_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_real = para1111;
      3'b001: rotation_factor1_real = para1111;
      3'b010: rotation_factor1_real = para1111;
      3'b011: rotation_factor1_real = para1111;
      3'b100: rotation_factor1_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor1_real = para9239;  //   cos(pi/8)  =   0.9239   W_16^1
      3'b110: rotation_factor1_real = para7071;  //   cos(pi/4)  =   0.7071   W_16^2
      3'b111: rotation_factor1_real = para3827;  //   cos(3pi/8) =   0.3827   W_16^3
    endcase
  end

// This always part controls signal rotation_factor1_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_imag = para0000;
      3'b001: rotation_factor1_imag = para0000;
      3'b010: rotation_factor1_imag = para0000;
      3'b011: rotation_factor1_imag = para0000;
      3'b100: rotation_factor1_imag = para0000;  // - sin(0)     =   0        W_16^0
      3'b101: rotation_factor1_imag = parn3827;  // - sin(pi/8)  = - 0.3827   W_16^1
      3'b110: rotation_factor1_imag = parn7071;  // - sin(pi/4)  = - 0.7071   W_16^2
      3'b111: rotation_factor1_imag = parn9239;  // - sin(3pi/8) = - 0.9239   W_16^3
    endcase
  end

// This always part controls signal rotation_factor2_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_real = para1111;
      3'b001: rotation_factor2_real = para1111;
      3'b010: rotation_factor2_real = para1111;
      3'b011: rotation_factor2_real = para1111;
      3'b100: rotation_factor2_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor2_real = para7071;  //   cos(pi/4)  =   0.7071   W_16^2
      3'b110: rotation_factor2_real = para0000;  //   cos(pi/2)  =   0        W_16^4
      3'b111: rotation_factor2_real = parn7071;  //   cos(3pi/4) = - 0.7071   W_16^6
    endcase
  end

// This always part controls signal rotation_factor2_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_imag = para0000;
      3'b001: rotation_factor2_imag = para0000;
      3'b010: rotation_factor2_imag = para0000;
      3'b011: rotation_factor2_imag = para0000;
      3'b100: rotation_factor2_imag = para0000;  // - sin(0)     =   0        W_16^0
      3'b101: rotation_factor2_imag = parn7071;  // - sin(pi/8)  = - 0.7071   W_16^2
      3'b110: rotation_factor2_imag = parn1111;  // - sin(pi/4)  = - 1        W_16^4
      3'b111: rotation_factor2_imag = parn7071;  // - sin(3pi/8) = - 0.7071   W_16^6
    endcase
  end

// This always part controls signal rotation_factor3_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_real = para1111;
      3'b001: rotation_factor3_real = para1111;
      3'b010: rotation_factor3_real = para1111;
      3'b011: rotation_factor3_real = para1111;
      3'b100: rotation_factor3_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor3_real = para3827;  //   cos(3pi/8) =   0.7071   W_16^3
      3'b110: rotation_factor3_real = parn7071;  //   cos(6pi/8) =   0        W_16^6
      3'b111: rotation_factor3_real = parn9239;  //   cos(9pi/8) = - 0.7071   W_16^9
    endcase
  end

// This always part controls signal rotation_factor3_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_imag = para0000;
      3'b001: rotation_factor3_imag = para0000;
      3'b010: rotation_factor3_imag = para0000;
      3'b011: rotation_factor3_imag = para0000;
      3'b100: rotation_factor3_imag = para0000;  // - sin(0)     = - 0        W_16^0
      3'b101: rotation_factor3_imag = parn9239;  // - sin(3pi/8) = - 0.7071   W_16^3
      3'b110: rotation_factor3_imag = parn7071;  // - sin(6pi/8) = - 0.1      W_16^6
      3'b111: rotation_factor3_imag = para3827;  // - sin(9pi/8) =   0.7071   W_16^9
    endcase
  end

//****************************** The following are instantiations *****************************

  multi16 multiBRR( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_1_real)
                  );

  multi16 multiBII( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_2_real)
                  );

  multi16 multiBRI( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_1_imag)
                  );

  multi16 multiBIR( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_2_imag)
                  );
  
//************************************************************************************************

  multi16 multiCRR( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_1_real)
                  );
                  
  multi16 multiCII( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_2_real)
                  );

  multi16 multiCRI( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_1_imag)
                  );

  multi16 multiCIR( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_2_imag)
                  );

//************************************************************************************************                

  multi16 multiDRR( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_1_real)
                  );

  multi16 multiDII( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_2_real)
                  );

  multi16 multiDRI( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_1_imag)
                  );

  multi16 multiDIR( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_2_imag)
                  );

//**************************** The following are assign statements ****************************

  assign in_17bit_0_real = calc_in[33:17];         // A (real)
  assign in_17bit_0_imag = calc_in[16:0];          // A (imag)

  assign in_8bit_1_real  = rotation_factor1_real;  // rotation factor for B (real)
  assign in_8bit_1_imag  = rotation_factor1_imag;  // rotation factor for B (imag)
  assign in_17bit_1_real = calc_in[67:51];         // B (real) 
  assign in_17bit_1_imag = calc_in[50:34];         // B (imag) 

  assign in_8bit_2_real  = rotation_factor2_real;  // rotation factor for C (real)
  assign in_8bit_2_imag  = rotation_factor2_imag;  // rotation factor for C (imag)
  assign in_17bit_2_real = calc_in[101:85];        // C (real) 
  assign in_17bit_2_imag = calc_in[84:68];         // C (imag) 

  assign in_8bit_3_real  = rotation_factor3_real;  // rotation factor for D (real)
  assign in_8bit_3_imag  = rotation_factor3_imag;  // rotation factor for D (imag)
  assign in_17bit_3_real = calc_in[135:119];       // D (real)  
  assign in_17bit_3_imag = calc_in[118:102];       // D (imag) 

//************************************************************************************************       

  assign temp_0_real = {in_17bit_0_real[16], in_17bit_0_real};  // A real
  assign temp_0_imag = {in_17bit_0_imag[16], in_17bit_0_imag};  // A imag

  assign temp_1_real = temp_2_1_real - temp_2_2_real;  //B * W^P     real
  assign temp_1_imag = temp_2_1_imag + temp_2_2_imag;  //B * W^P     imag

  assign temp_2_real = temp_3_1_real - temp_3_2_real;  //C * W^{2p}  real
  assign temp_2_imag = temp_3_1_imag + temp_3_2_imag;  //C * W^{2p}  imag

  assign temp_3_real = temp_4_1_real - temp_4_2_real;  //D * W^{3P}  real
  assign temp_3_imag = temp_4_1_imag + temp_4_2_imag;  //D * W^{3P}  imag


  assign temp_0 = {temp_0_real,temp_0_imag};   // A
  assign temp_1 = {temp_1_real, temp_1_imag};  // B * Wp
  assign temp_2 = {temp_2_real, temp_2_imag};  // C * W2p
  assign temp_3 = {temp_3_real, temp_3_imag};  // D * W3p

//************************************************************************************************       

  assign out_0_real = temp_0_real + temp_1_real + temp_2_real + temp_3_real;
  assign out_0_imag = temp_0_imag + temp_1_imag + temp_2_imag + temp_3_imag;

  assign out_1_real = temp_0_real - temp_1_real + temp_2_real - temp_3_real;
  assign out_1_imag = temp_0_imag - temp_1_imag + temp_2_imag - temp_3_imag;

  assign out_2_real = temp_0_real - temp_1_imag - temp_2_real + temp_3_imag;
  assign out_2_imag = temp_0_imag + temp_1_real - temp_2_imag - temp_3_real;
  assign out_3_real = temp_0_real + temp_1_imag - temp_2_real - temp_3_imag;
  assign out_3_imag = temp_0_imag - temp_1_real - temp_2_imag + temp_3_real;

  assign calc_out = { out_2_real, out_2_imag, 
                      out_1_real, out_1_imag,
                      out_3_real, out_3_imag,
                      out_0_real, out_0_imag };

endmodule
