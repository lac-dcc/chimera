// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module tb_control_unit;

  reg clk;
  reg [31:0] i_instr;
  wire [3:0] o_alu_ctrl;
  
  integer i;
  reg [31:0] test_instr [45:0]; // Array to store instruction codes

  // Instantiate the control_unit module
  control_unit uut (
    .i_instr(i_instr),
    .o_alu_ctrl(o_alu_ctrl)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Open VCD file
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_control_unit);
    
    test_instr[0]  = 32'h7FF00293;
    test_instr[1]  = 32'h00F29313;
    test_instr[2]  = 32'h00530333;
    test_instr[3]  = 32'h0082D293;
    test_instr[4]  = 32'h7FF2C293;
    test_instr[5]  = 32'h7F02F293;
    test_instr[6]  = 32'h0FF2E293;
    test_instr[7]  = 32'h00602023;
    test_instr[8]  = 32'h00601223;
    test_instr[9]  = 32'h00600423;
    test_instr[10] = 32'h00400383;
    test_instr[11] = 32'h00802E03;
    test_instr[12] = 32'h00001E83;
    test_instr[13] = 32'h00005E83;
    test_instr[14] = 32'h00404383;
    test_instr[15] = 32'h01DE03B3;
    test_instr[16] = 32'h41D38E33;
    test_instr[17] = 32'h007E9E33;
    test_instr[18] = 32'h007EDE33;
    test_instr[19] = 32'h00631293;
    test_instr[20] = 32'h4072D2B3;
    test_instr[21] = 32'h007EAE33;
    test_instr[22] = 32'h01D3BE33;
    test_instr[23] = 32'h0013AE13;
    test_instr[24] = 32'h7FFE3E13;
    test_instr[25] = 32'h01DE43B3;
    test_instr[26] = 32'h01DE73B3;
    test_instr[27] = 32'h01DE63B3;
    test_instr[28] = 32'h800FF337;
    test_instr[29] = 32'h003E8317;
    test_instr[30] = 32'h01400567;
    test_instr[31] = 32'h00A00393;
    test_instr[32] = 32'h00A39393;
    test_instr[33] = 32'h0FF00313;
    test_instr[34] = 32'h0FE00293;
    test_instr[35] = 32'h02628063;
    test_instr[36] = 32'h00534E63;
    test_instr[37] = 32'h00536C63;
    test_instr[38] = 32'h00629A63;
    test_instr[39] = 32'h0063D863;
    test_instr[40] = 32'hF9C00293;
    test_instr[41] = 32'h0062F463;
    test_instr[42] = 32'h06400293;
    test_instr[43] = 32'h0FE00313;
    test_instr[44] = 32'h0FF00393;
    test_instr[45] = 32'hFE5FF3EF;
    
      // Apply test vectors one by one
      for (i = 0; i < 52; i = i + 1) begin
        i_instr = test_instr[i]; // Apply the instruction code
        #10; // Wait for a few time units

        // Display instruction and corresponding ALU control signal
        $display("Instruction: 0x%h, ALU Control: %b", i_instr, o_alu_ctrl);
      end

      // Finish simulation
      $finish;
    end

endmodule

