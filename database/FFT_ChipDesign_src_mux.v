//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: mux
//
// Type: Sequential
//
// Purpose: 
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/14: Create；
// - Version 1.1 20/04/30: Fix error by @luotian12345.
//
// Notes:
//
//**********************************************************

module mux(

  input wire        mux_flag,
  input wire        clk,
  input wire        rst_n,
  input wire[135:0] data_in_1,
  input wire[135:0] data_in_2,
  input wire[135:0] data_in_3,
  output reg[135:0] data_out

  );
  reg [3:0] counter;
  reg [33:0] R1;
  reg [33:0] R2;
  reg [33:0] R3;
  reg [33:0] R4;

// This always part controls signal data_out. 
  always @ ( mux_flag or data_in_1 or data_in_2) begin
    if(counter == 2)
      data_out <= {R4,R3,R2,R1};
    else if ( mux_flag )
      data_out <= data_in_1;
    else
      data_out <= data_in_2;
  end

// This always part controls signal counter. 
  always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
    counter <= 0;
   else  
    counter <= counter + 1;
  end

  // This always part controls signal R1. 
  always @ ( mux_flag or data_in_1 or data_in_2) 
    if(counter == 14)
      R1 <= data_in_3[33:0];
    else
      R1 <= R1;

  // This always part controls signal R2. 
  always @ ( mux_flag or data_in_1 or data_in_2) 
    if(counter == 15)
      R2 <= data_in_3[33:0];
    else
      R2 <= R2;

  // This always part controls signal R3. 
  always @ ( mux_flag or data_in_1 or data_in_2) 
    if(counter == 0)
      R3 <= data_in_3[33:0];
    else
      R3 <= R3;

  // This always part controls signal R4. 
  always @ ( mux_flag or data_in_1 or data_in_2) 
    if(counter == 1)
      R4 <= data_in_3[33:0];
    else
      R4 <= R4;

endmodule
