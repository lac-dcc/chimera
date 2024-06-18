// This program was cloned from: https://github.com/VenciFreeman/FFT_ChipDesign
// License: Mozilla Public License 2.0

//**********************************************************
// Author: @Qi Yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: ctrl
//
// Type: Sequential
//
// Purpose: control rotation factors and set flag, has been verified correctly in Modelsim.
//
// Details:
//
// Release History:
// - Version 1.0 20/03/26: Create.
// - Version 1.1 20/03/27: Create counter core_tick & mux/demux flag logic according to core_tick.
// - Version 1.2 20/03/28: Create rotation logic according to core_tick & add specific parameters；
// - Version 1.3 20/04/21: Edit format by @Vencifreeman;
// - Version 1.4 20/04/21: Edit rotation.
//
// Notes:
//
//**********************************************************

module ctrl(
  input  wire       clk,
  input  wire       rst_n,
  input  wire       s_p_flag_in,  // s_p_flag_in equals to 1 when s_p module has 13 elements, else equals to 0
  output reg        mux_flag,
  output reg  [2:0] rotation,
  output reg        demux_flag
  );

  parameter STOP = 3'b0;
  parameter MUX_IDLE = 1'b0;
  parameter ROT_IDLE = 3'b0;
  parameter DEMUX_IDLE = 1'b0;
  parameter S_P_SEL_0 = 1'b0;
  parameter S_P_SEL_1 = 1'b0;
  parameter S_P_SEL_2 = 1'b0;
  parameter S_P_SEL_3 = 1'b0;
  parameter REG_SEL_0 = 1'b1;
  parameter REG_SEL_1 = 1'b1;
  parameter REG_SEL_2 = 1'b1;
  parameter REG_SEL_3 = 1'b1;
  parameter P_S_SEL_0 = 1'b0;
  parameter P_S_SEL_1 = 1'b0;
  parameter P_S_SEL_2 = 1'b0;
  parameter P_S_SEL_3 = 1'b0;

  reg[2:0] core_tick;  // count how many sequential logic

// This always part controls signal core_tick. 
  always @ ( posedge clk or negedge rst_n) begin
    if ( !rst_n )
      core_tick <= STOP; // 3 bits
    else if ( core_tick == STOP ) begin
      case ( s_p_flag_in )
        1'b0: core_tick <= STOP;
        1'b1: core_tick <= core_tick + 1;
      endcase
    end else
      core_tick <= core_tick + 1;
  end

// This always part controls signal mux_flag.
  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      mux_flag <= MUX_IDLE;
    else begin
      case ( core_tick )
        3'b000: mux_flag <= S_P_SEL_0;  // Comment here to lower power consumption but no use
        3'b001: mux_flag <= S_P_SEL_1;  // 15
        3'b010: mux_flag <= S_P_SEL_2;  // 16
        3'b011: mux_flag <= S_P_SEL_3;  // 17
        3'b100: mux_flag <= REG_SEL_0;  // 18
        3'b101: mux_flag <= REG_SEL_1;  // 19
        3'b110: mux_flag <= REG_SEL_2;  // 20
        3'b111: mux_flag <= REG_SEL_3;  // 21
        // If MUX/DEMUX has 3 OPTIONS (SP/PS, REG, IDLE), but no use to lower power consumption because still need compute IDLE
      endcase
    end
  end

// This always part controls signal demux_flag.
  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      demux_flag <= DEMUX_IDLE;
    else begin
      case ( core_tick )
        3'b000: demux_flag <= REG_SEL_0;  // Comment here to lower power consumption but no use
        3'b001: demux_flag <= REG_SEL_1;  // 15
        3'b010: demux_flag <= REG_SEL_2;  // 16
        3'b011: demux_flag <= REG_SEL_3;  // 17
        3'b100: demux_flag <= P_S_SEL_0;  // 18
        3'b101: demux_flag <= P_S_SEL_1;  // 19
        3'b110: demux_flag <= P_S_SEL_2;  // 20
        3'b111: demux_flag <= P_S_SEL_3;  // 21
        // If MUX/DEMUX has 3 OPTIONS (SP/PS, REG, IDLE), but no use to lower power consumption because still need compute IDLE
      endcase
    end
  end

// This always part controls signal rotation.
always @ ( posedge clk or negedge rst_n ) begin
  if ( !rst_n )
    rotation <= ROT_IDLE; 
  else
    rotation <=core_tick;
end
    
endmodule