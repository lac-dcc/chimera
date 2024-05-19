// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341457971277988435(
  input [7:0] io_in, 
  output [7:0] io_out
);

  wire uart_tx;

  assign io_out[0] = uart_tx;

  hello_world_341457971277988435 hello_world(
    .clk(io_in[0]),    
    .reset(io_in[1]),
    
    .uart_tx(uart_tx)
  );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.
module hello_world_341457971277988435 (
    input clk,
    input reset,
    
    output reg uart_tx
  );
  
  parameter START_BIT = 1'b0;
  parameter STOP_BIT = 1'b1;
  parameter IDLE_BIT = 1'b1;

  reg        [3:0] bit_counter;
  reg        [3:0] byte_counter;

  reg       [3:0] next_bit_counter; //0 to 10
  reg       [3:0] next_byte_counter; //0 to MSG_LEN (one more than MSG_LEN-1, for one extra idle word length)
  
  parameter FRAME_LENGTH = 11; //bit lengths per word length
  
  parameter MSG_LEN = 13;
  wire [7:0] hello_world_ascii [0:MSG_LEN-1];
  assign hello_world_ascii[0]  = "H";
  assign hello_world_ascii[1]  = "e";
  assign hello_world_ascii[2]  = "l";
  assign hello_world_ascii[3]  = "l";
  assign hello_world_ascii[4]  = "o";
  assign hello_world_ascii[5]  = " ";
  assign hello_world_ascii[6]  = "W";
  assign hello_world_ascii[7]  = "o";
  assign hello_world_ascii[8]  = "r";
  assign hello_world_ascii[9]  = "l";
  assign hello_world_ascii[10] = "d";
  assign hello_world_ascii[11] = "!";
  assign hello_world_ascii[12] = "\n";
  
  
  wire [0:FRAME_LENGTH-1] current_frame; //1 + 1 + 8 + 1
    assign current_frame = {
    IDLE_BIT,
    START_BIT,
    hello_world_ascii[byte_counter][0],
    hello_world_ascii[byte_counter][1],
    hello_world_ascii[byte_counter][2],
    hello_world_ascii[byte_counter][3],
    hello_world_ascii[byte_counter][4],
    hello_world_ascii[byte_counter][5],
    hello_world_ascii[byte_counter][6],
    hello_world_ascii[byte_counter][7],
    STOP_BIT
  };

  always @(posedge clk) begin
    if (reset) begin
      bit_counter  <= 0;
      byte_counter <= 0;
    end else begin
      bit_counter  <= next_bit_counter;
      byte_counter <= next_byte_counter;
    end
  end

  always @(*) begin
    next_bit_counter = bit_counter;
    next_byte_counter = byte_counter;
    
    if(bit_counter < FRAME_LENGTH-1) begin
      next_bit_counter = bit_counter + 1;
    end else begin
      next_bit_counter = 0;

      if(byte_counter < MSG_LEN) begin
        next_byte_counter = byte_counter + 1;
      end else begin
        next_byte_counter = 0;
      end
    end
    
    uart_tx = IDLE_BIT;
    if(byte_counter != MSG_LEN) begin
      uart_tx = current_frame[bit_counter];  
    end //else leave a blank byte length at the
  end


endmodule