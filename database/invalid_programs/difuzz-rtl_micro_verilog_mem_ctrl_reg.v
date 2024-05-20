// This program was cloned from: https://github.com/compsec-snu/difuzz-rtl
// License: BSD 3-Clause "New" or "Revised" License

`define READY_S 2'h0
`define PENDING_S 2'h1
`define BUSY_S 2'h2

`define READY_F 1'h0
`define BUSY_F 1'h1

`define READY_R 2'h0
`define PENDING_R1 2'h1
`define PENDING_R2 2'h1
`define PENDING_R3 2'h1
`define BUSY_R 2'h2


module mem_ctrl(
  input clock,
  input reset,

  input        sdram_valid, 
  input [3:0]  sdram_data_i,
  input        flash_valid,
  input [7:0]  flash_data_i,
  input        rom_valid,
  input [2:0]  rom_data_i,

  output       sdram_ready,
  output       flash_ready,
  output       rom_ready,

  output       out_valid,
  output [7:0] out_data,

  output [2:0] coverage,
  output bug
);

  reg[1:0] state_sdram; // READY, RECEIVING, BUSY
  reg      state_flash; // READY, BUSY
  reg[2:0] state_rom;

  reg[7:0] data_sdram;
  reg[7:0] data_flash;

  reg covmap[0:7];
  reg[2:0] reg_state;
  reg[2:0] covsum;

  assign coverage = covsum;

  integer i;
  initial begin
    for (i=0; i<8; i=i+1)
      covmap[i] = 0;
    covsum = 0;
  end

  always @(posedge clock) begin
    reg_state <= {state_flash, state_sdram};

    if (!covmap[reg_state]) begin
      covsum <= covsum + 1'h1;
    end
  end

  assign bug = ((state_sdram == `BUSY_S) && (state_flash == `BUSY_F) && (state_rom == `BUSY_R))? 1 : 0;
    
/********** combinational **********/

  assign sdram_ready = (state_sdram != `BUSY_S);
  assign flash_ready = (state_flash != `BUSY_F);
  assign rom_ready = (state_flash != `BUSY_F);

  assign out_valid = (state_sdram == `BUSY_S) ||
                      (state_flash == `BUSY_F) ||
                      (state_rom == `BUSY_R);
  assign out_data = (state_sdram == `BUSY_S) ?
                      data_sdram : data_flash;

/********** sequential **********/

  always @(posedge clock) begin
    if (reset) begin
      state_sdram <= `READY_S;
      state_flash <= `READY_F;
      data_sdram <= 8'h0;
      data_flash <= 8'h0;
    end else begin
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

      if (state_rom == `READY_R) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R1;
          data_rom <= {6'b000000, rom_data_i};
        end
      end else if (state_rom == `PENDING_R1) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R2;
          data_rom <= {4'b0000, rom_data_i, 2'b00} | data_rom;
        end
      end else if (state_rom == `PENDING_R2) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R3;
          data_rom <= {2'b00, rom_data_i, 4'b0000} | data_rom;
        end
      end else if (state_rom == `PENDING_R3) begin
        if (rom_valid) begin
          state_rom <= `BUSY_R;
          data_rom <= {rom_data_i, 6'b000000} | data_rom;
        end
      end
    end
  end
endmodule
