// This program was cloned from: https://github.com/VenciFreeman/FFT_ChipDesign
// License: Mozilla Public License 2.0

//**********************************************************
// Author: Luo Tian, copyright 2020
// e-mail: luotian12345@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: s_p
//
// Type: Sequential
//
// Purpose: Convert series input to parallel input.
// 
// Details:
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/02/20: Modify;
// - Version 1.2 20/04/21: Edit format by @VenciFreeman.
//
// Notes:
//
//**********************************************************

module s_p(

  input  wire         clk,
  input  wire         rst_n,
  input  wire [33:0]  data_in_1,
  output reg  [135:0] data_out_1,
  output reg          s_p_flag_out

  );

  reg [33:0] R0;
  reg [33:0] R1;
  reg [33:0] R2;
  reg [33:0] R3;
  reg [33:0] R4;
  reg [33:0] R5;
  reg [33:0] R6;
  reg [33:0] R7;
  reg [33:0] R8;
  reg [33:0] R9;
  reg [33:0] R10;
  reg [33:0] R11;
  reg [33:0] R12;
  reg [33:0] R13;
  reg [33:0] R14;
  reg [33:0] R15;

  reg [3:0]  counter;
  reg        s_p_flag_mux;

// This always part controls signal counter. 
  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      counter <= 4'b0;
    else if (counter == 4'b1111)
      counter <= 4'b0;
    else
      counter <= counter + 4'b0001;
  end

// This always part controls signal s_p_flag_out. 
  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      s_p_flag_out <= 0;
    else if (counter == 4'b1100)
      s_p_flag_out <= 1'b1;
    else
      s_p_flag_out <= 1'b0;
  end

// This always part controls signal s_p_flag_mux.
  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      s_p_flag_mux <= 0;
    else begin
      case ( counter )
        4'b0000: s_p_flag_mux <= 1'b1;
        4'b1101: s_p_flag_mux <= 1'b1;
        4'b1110: s_p_flag_mux <= 1'b1;
        4'b1111: s_p_flag_mux <= 1'b1;
        default: s_p_flag_mux <= 1'b0;
      endcase
    end
  end

// This always part controls signal data_in_1.
  always @ ( posedge clk or negedge rst_n ) begin
    case ( counter )
      4'b0000: data_out_1  = {R15,  R11, R7,  R3};
      4'b1101: data_out_1  = {R12,  R8,  R4,  R0};
      4'b1110: data_out_1  = {R13,  R9,  R5,  R1};
      4'b1111: data_out_1  = {R14,  R10, R6,  R2};
    endcase
end

// This always part controls register.
  always @(posedge clk or negedge rst_n)begin
    case(counter)
      4'b0000: R0  <= data_in_1;
      4'b0001: R1  <= data_in_1;
      4'b0010: R2  <= data_in_1;
      4'b0011: R3  <= data_in_1;
      4'b0100: R4  <= data_in_1;
      4'b0101: R5  <= data_in_1;
      4'b0110: R6  <= data_in_1;
      4'b0111: R7  <= data_in_1;
      4'b1000: R8  <= data_in_1;
      4'b1001: R9  <= data_in_1;
      4'b1010: R10 <= data_in_1;
      4'b1011: R11 <= data_in_1;
      4'b1100: R12 <= data_in_1;
      4'b1101: R13 <= data_in_1;
      4'b1110: R14 <= data_in_1;
      4'b1111: R15 <= data_in_1;
    endcase
  end
  
endmodule
