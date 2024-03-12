`define READY_S 3'h0
`define PENDING_S1 3'h1
`define PENDING_S2 3'h2
`define PENDING_S3 3'h3
`define BUSY_S 3'h4

`define READY_F 3'h0
`define PENDING_F1 3'h1
`define PENDING_F2 3'h2
`define PENDING_F3 3'h3
`define BUSY_F 3'h4

`define READY_R 3'h0
`define PENDING_R1 3'h1
`define PENDING_R2 3'h2
`define PENDING_R3 3'h3
`define BUSY_R 3'h4


module mem_ctrl(
  input clock,
  input reset,
  input meta_reset,

  input        sdram_valid, 
  input [1:0]  sdram_data_i,
  input        flash_valid,
  input [3:0]  flash_data_i,
  input        rom_valid,
  input        rom_data_i,

  output       sdram_ready,
  output       flash_ready,
  output       rom_ready,

  output       out_valid,
  output [3:0] out_data,

  output [8:0] coverage,
  output [8:0] io_cov_sum,
  output bug
);

  reg[2:0] state_sdram; // READY, RECEIVING, BUSY
  reg[2:0] state_flash; // READY, BUSY
  reg[2:0] state_rom;

  reg[3:0] data_sdram;
  reg[3:0] data_flash;
  reg[3:0] data_rom;

  reg covmap[0:511];
  reg[8:0] reg_state;
  reg[8:0] covsum;

  assign coverage = covsum;
  assign io_cov_sum = covsum;

  integer i;
  initial begin
    for (i=0; i<512; i=i+1)
      covmap[i] = 0;
    covsum = 0;
  end

  always @(posedge clock) begin
    reg_state <= {state_flash, state_sdram, state_rom};

    if (!covmap[reg_state]) begin
      covsum <= covsum + 1'h1;
      covmap[reg_state] <= 1'h1;
    end

    if (meta_reset) begin
      covsum <= 9'h0;
      for (i=0; i<512; i=i+1)
        covmap[i] = 1'h0;
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
      state_rom <= `READY_R;
      data_sdram <= 4'h0;
      data_flash <= 4'h0;
      data_rom <= 4'h0;
    end else begin
      if (state_sdram == `READY_S) begin
        if (sdram_valid) begin
          state_sdram <= `PENDING_S1;
          data_sdram <= {2'b00, sdram_data_i};
        end
      end else if (state_sdram == `PENDING_S1) begin
        if (sdram_valid) begin
          state_sdram <= `PENDING_S2;
          data_sdram <= {sdram_data_i, 2'b00} | data_sdram;
        end else begin
          state_sdram <= `READY_S;
        end 
      end else if (state_sdram == `PENDING_S2) begin
        if (sdram_valid) begin
          state_sdram <= `PENDING_S3;
        end else begin
          state_sdram <= `READY_S;
        end
      end else if (state_sdram == `PENDING_S3) begin
        if (sdram_valid) begin
          state_sdram <= `READY_S;
        end else begin
          state_sdram <= `BUSY_S;
        end
      end else if (state_sdram == `BUSY_S) begin
        state_sdram <= `READY_S;
      end

      if (state_flash == `READY_F) begin
        if (flash_valid) begin
          state_flash <= `PENDING_F1;
          data_flash <= flash_data_i;
        end else begin
          state_flash <= `READY_F;
        end
      end else if (state_flash == `PENDING_F1) begin
        if (flash_valid) begin
          state_flash <= `PENDING_F2;
        end else begin
          state_flash <= `READY_F;
        end
      end else if (state_flash == `PENDING_F2) begin
        if (flash_valid) begin
          state_flash <= `PENDING_F3;
        end else begin
          state_flash <= `READY_F;
        end
      end else if (state_flash == `PENDING_F3) begin
        if (flash_valid) begin
          state_flash <= `BUSY_F;
        end else begin
          state_flash <= `READY_F;
        end
      end else begin
        state_flash <= `READY_F;
      end

      if (state_rom == `READY_R) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R1;
          data_rom <= {3'b000, rom_data_i};
        end else begin
          state_rom <= `READY_R;
        end
      end else if (state_rom == `PENDING_R1) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R2;
          data_rom <= {2'b00, rom_data_i, 1'b0} | data_rom;
        end else begin
          state_rom <= `READY_R;
        end
      end else if (state_rom == `PENDING_R2) begin
        if (rom_valid) begin
          state_rom <= `PENDING_R3;
          data_rom <= {1'b0, rom_data_i, 2'b00} | data_rom;
        end else begin
          state_rom <= `READY_R;
        end
      end else if (state_rom == `PENDING_R3) begin
        if (rom_valid) begin
          state_rom <= `BUSY_R;
          data_rom <= {rom_data_i, 3'b000} | data_rom;
        end else begin
          state_rom <= `READY_R;
        end
      end else begin
        state_rom <= `READY_R;
      end
    end
  end
endmodule
