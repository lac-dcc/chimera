//**********************************************************
// Author: Luo Tian, copyright 2020
// e-mail: luotian12345@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: reg1
//
// Type: Sequential
//
// Purpose: Storage of butterfly operation intermediate data
// 
// Details:
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/04/20: Modify;
// - Version 1.2 20/04/21: Edit format by @VenciFreeman.
//
// Notes:
//
//**********************************************************

module reg1(

  input  wire         clk,
  input  wire         rst_n,
  input  wire [135:0] data_in_2,        // The data from butterfly (or structurally, from DEMUX)
  input  wire         reg_datain_flag,  // control the input
  output reg  [135:0] data_out_2        // The data to MUX

  );

  reg reg_flag_mux;  // control the output

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
  
  reg [1:0] counter1;
  reg [1:0] counter2;

// This always part controls signal counter1. 
  always @ ( posedge clk ) begin
    if ( !rst_n )
      counter1 <= 2'b00;
    else if ( reg_datain_flag )
      counter1 <= counter1 + 1'b1;
  end

// This always part controls registers. 
  always @ ( posedge clk ) begin
    if ( reg_datain_flag )begin
      case ( counter1 )
        2'b01: begin
          R0  <= data_in_2[33:0];
          R1  <= data_in_2[67:34];
          R2  <= data_in_2[101:68];
          R3  <= data_in_2[135:102];
        end
        2'b10: begin
          R4  <= data_in_2[33:0];
          R5  <= data_in_2[67:34];
          R6  <= data_in_2[101:68];
          R7  <= data_in_2[135:102];
        end
        2'b11: begin
          R8  <= data_in_2[33:0];
          R9  <= data_in_2[67:34];
          R10 <= data_in_2[101:68];
          R11 <= data_in_2[135:102];
        end
        2'b00: begin
          R12 <= data_in_2[33:0];
          R13 <= data_in_2[67:34];
          R14 <= data_in_2[101:68];
          R15 <= data_in_2[135:102];
        end
      endcase
    end
  end

// This always part controls signal reg_flag_mux. 
  always @ ( posedge clk ) begin
    if ( !rst_n )
      reg_flag_mux <= 1'b0;

    else if ( counter1 == 2'b11 )
      reg_flag_mux <= 1'b1;

    else if ( counter2 == 2'b11 )
      reg_flag_mux <= 1'b0;
  end
  
// This always part controls signal counter2. 
  always @ ( posedge clk ) begin
    if ( !rst_n )
      counter2 <= 2'b00;

    else if ( reg_flag_mux )
      counter2 <= counter2 + 2'b01;
  end

// This always part controls signal data_out_2. 
  always @ ( posedge clk ) begin
    if ( reg_flag_mux ) begin
      case ( counter2 )
        2'b00: data_out_2 <= {R12,  R8,  R4,  R0};
        2'b01: data_out_2 <= {R13,  R9,  R5,  R1};
        2'b10: data_out_2 <= {R14,  R10, R6,  R2};
        2'b11: data_out_2 <= {R15,  R11, R7,  R3};
    endcase
    end
  end

endmodule
