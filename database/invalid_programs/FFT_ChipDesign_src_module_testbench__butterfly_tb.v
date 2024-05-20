// This program was cloned from: https://github.com/VenciFreeman/FFT_ChipDesign
// License: Mozilla Public License 2.0

//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly_tb
//
// Type: Sequential
//
// Purpose: Test butterfly module.
//
// Details: 
// - Input sequence:  12,8,4,0; 13,9,5,1; 14,10,6,2; 15,11,7,3;
// - Temp read sequence: temp4, temp3, temp2, temp1, low to high;
// - Output sequence: 3,2,1,0; 7,6,5,4; 11,10,9,8; 15,14,13,12.
//
// Release History:
// - Version 1.0 20/04/15: Create;
// - Version 2.0 20/04/16: Fix some errors;
// - Version 2.1 20/04/17: Change test vectors;
// - Version 2.2 20/04/17: Edit display style;
// - Version 2.3 20/04/17: Change latency;
// - Version 2.4 20/04/17: Fix input vectors;
// - Version 2.5 20/04/17: Change output display;
// - Version 2.6 20/04/18: Check again, add comments;
// - Version 2.7 20/04/18: Transform to Combinatorial logic;
// - Version 3.0 20/04/19: Debug finished. No error, function correct.
//
// Notes:
// - Data format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im);
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "butterfly.v"

module butterfly_tb();

  reg          clk_test;
  reg          rst_n_test;
  reg  [135:0] calc_in_test;
  reg  [2:0]   rotation_test;
  wire [135:0] calc_out_test;

  reg  [135:0] temp1, temp2, temp3, temp4;

  parameter clk_freq = 10;  // or 8 for 125 MHz

  butterfly butterfly0(.calc_in(calc_in_test),
                       .rotation(rotation_test),
                       .calc_out(calc_out_test)
  );

  initial begin
    clk_test = 0;
    rst_n_test = 0;
    calc_in_test = 135'b0;
    rotation_test = 3'b0;
  end

  always begin
      #(clk_freq / 2) clk_test = ~ clk_test;	// create a 100 MHz clock
      rst_n_test = 1;  // enable
  end

  initial begin
//********************************* The following is the 16 inputs *******************************
    $display("\n\nLoad Data\n");
    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000001000000000000000000000000000000001100000000000000000000000000000000010000000000000000000000000;
      //                  |   x[12]Real   ||   x[12]Imag   ||    x[8]Real   ||    x[8]Imag   ||    x[4]Real   ||    x[4]Imag   ||    x[0]Real   ||   x[0]Imag    |
      rotation_test = 3'b000;
    end

    #10 temp1 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000010000000000000001000000000000000001000000000000000100000000000000000000000000000000000000000000;
      //                  |   x[13]Real   ||   x[13]Imag   ||    x[9]Real   ||    x[9]Imag   ||    x[5]Real   ||    x[5]Imag   ||    x[1]Real   ||   x[1]Imag    |
      rotation_test = 3'b001;
    end

    #10 temp2 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000001000000000000000000000000000000000100000000000001000000000000000000010000000000000000000000000;
      //                  |   x[14]Real   ||   x[14]Imag   ||    x[10]Real  ||    x[10]Imag  ||    x[6]Real   ||    x[6]Imag   ||    x[2]Real   ||   x[2]Imag    |
      rotation_test = 3'b010;
    end

    #10 temp3 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000000000000000000000000000000000000001000000000000000010000000000000000000000000000000000000000000;
    //                    |   x[15]Real   ||    x[15]Imag  ||    x[11]Real  ||    x[11]Imag  ||    x[7]Real   ||    x[7]Imag   ||    x[3]Real   ||   x[3]Imag    |
      rotation_test = 3'b011;
    end

    #10 temp4 = calc_out_test;

//************************************ The following is stage 2 **********************************
    $display("\n\nOUTPUT\n");

    #10 begin
      calc_in_test = {temp4[33:0], temp3[33:0], temp2[33:0], temp1[33:0]};
      rotation_test = 3'b100;
    end

    #10 begin
      $display("[0]  %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);
      $display("[4]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
      $display("[8]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
      $display("[12] %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    end

    #10 begin
      calc_in_test = {temp4[67:34], temp3[67:34], temp2[67:34], temp1[67:34]};
      rotation_test = 3'b101;
    end
    
    #10 begin
      $display("[1]  %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);
      $display("[5]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
      $display("[9]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
      $display("[13] %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    end

    #10 begin
      calc_in_test = {temp4[101:68], temp3[101:68], temp2[101:68], temp1[101:68]};
      rotation_test = 3'b110;
    end
    
    #10 begin
      $display("[2]  %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);
      $display("[6]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
      $display("[10] %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
      $display("[14] %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    end

    #10 begin
      calc_in_test = {temp4[135:102], temp3[135:102], temp2[135:102], temp1[135:102]};
      rotation_test = 3'b111;
    end
    
    #10 begin
      $display("[3]  %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);
      $display("[7]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
      $display("[11] %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
      $display("[15] %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    end

    #100 $stop; 
      
  end

endmodule