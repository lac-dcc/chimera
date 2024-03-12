`define READY_S 0
`define PENDING_S 1
`define BUSY_S 2

`define READY_F 0
`define BUSY_F 1

module mem_ctrl(
  input clock,
  input reset,

  input        sdram_valid, 
  input [3:0]  sdram_data_i,
  input        flash_valid,
  input [7:0]  flash_data_i,

  output       sdram_ready,
  output       flash_ready,

  output       out_valid,
  output [7:0] out_data,

  output [2:0] coverage,
  output bug
);

  reg[1:0] state_sdram; // READY, RECEIVING, BUSY
  reg      state_flash; // READY, BUSY

  reg[7:0] data_sdram;
  reg[7:0] data_flash;

/********** combinational **********/

  assign sdram_ready = (state_sdram != `BUSY_S);
  assign flash_ready = (state_flash != `BUSY_F);

  assign out_valid = (state_sdram == `BUSY_S) ||
                      (state_flash == `BUSY_F);
  assign out_data = (state_sdram == `BUSY_S) ?
                      data_sdram : data_flash;

/********** sequential **********/

  always @(posedge clock) begin
    if (state_sdram == `READY_S) begin
      if (sdram_valid) begin
        state_sdram <= `PENDING_S;
        data_sdram <= {4'b0000, sdram_data_i};
      end
    end else if (state_sdram == `PENDING_S) begin
      if (sdram_valid) begin
        state_sdram <= `BUSY_S;
        data_sdram <= {sdram_data_i, 4'b0000} | data_sdram;
      end
    end else if (state_sdram == `BUSY_S) begin
      state_sdram <= `PENDING_S;
    end

    if (state_flash == `READY_F) begin
      if (flash_valid) begin
        state_flash <= `BUSY_F;
        data_flash <= flash_data_i;
      end
    end else if (state_flash == `BUSY_F) begin
      state_flash <= `READY_F;
    end
  end
endmodule
