// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module tb_cocotb #(
  parameter DATA_WIDTH          = 32,
  parameter FIFO_WIDTH          = 8
)(

  input                             rst,
  input       [31:0]                test_id,

  //write side
  input                             WR_CLK,
  output                            WR_RDY,
  input                             WR_ACT,
  output      [23:0]                WR_SIZE,
  input                             WR_STB,
  input       [DATA_WIDTH - 1: 0]   WR_DATA,
  output                            WR_STARVED,

  //read side
  input                             RD_CLK,
  input                             RD_STB,
  output                            RD_RDY,
  input                             RD_ACT,
  output      [23:0]                RD_SIZE,
  output      [DATA_WIDTH - 1: 0]   RD_DATA,

  output                            RD_INACTIVE
);

//Local Parameters

//Registers/Wires
reg                                 r_rst;

//Submodules
block_fifo#(
  .DATA_WIDTH      (DATA_WIDTH      ),
  .ADDRESS_WIDTH   (FIFO_WIDTH      )
)pp(
  //universal input
  .reset           (r_rst           ),

  //Write Path
  .write_clock     (WR_CLK          ),
  .write_ready     (WR_RDY          ),
  .write_activate  (WR_ACT          ),
  .write_fifo_size (WR_SIZE         ),
  .write_strobe    (WR_STB          ),
  .write_data      (WR_DATA         ),
  .starved         (WR_STARVED      ),

  //Read Path
  .read_clock      (RD_CLK          ),
  .read_strobe     (RD_STB          ),
  .read_ready      (RD_RDY          ),
  .read_activate   (RD_ACT          ),
  .read_count      (RD_SIZE         ),
  .read_data       (RD_DATA         ),

  .inactive        (RD_INACTIVE     )
);

//There is a timing thing in COCOTB when stiumlating a signal, sometimes it can be corrupted if not registered
always @ (*) r_rst          = rst;

//Submodules
//Asynchronous Logic
//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule
