// This program was cloned from: https://github.com/compsec-snu/difuzz-rtl
// License: BSD 3-Clause "New" or "Revised" License

`define READY_S 2'h0
`define PENDING_S1 2'h1
`define BUSY_S 2'h2

`define READY_F 2'h0
`define PENDING_F1 2'h1
`define BUSY_F 2'h2

`define READY_R 2'h0
`define PENDING_R1 2'h1
`define BUSY_R 2'h2


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
  output [5:0] io_cov_sum,
  output bug
);

  reg[1:0] state_sdram; // READY, RECEIVING, BUSY
  reg[1:0] state_flash; // READY, BUSY
  reg[1:0] state_rom;

  reg[3:0] data_sdram;
  reg[3:0] data_flash;
  reg[3:0] data_rom;

  reg covmap[0:63];
  reg[5:0] reg_state;
  reg[5:0] covsum;

  assign io_cov_sum = covsum;

  integer i;
  initial begin
    for (i=0; i<64; i=i+1)
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
      covsum <= 6'h0;
      for (i=0; i<64; i=i+1)
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
          state_sdram <= `BUSY_S;
          data_sdram <= {sdram_data_i, 2'b00} | data_sdram;
        end else begin
          state_sdram <= `READY_S;
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
          state_rom <= `BUSY_R;
          data_rom <= {2'b00, rom_data_i, 1'b0} | data_rom;
        end else begin
          state_rom <= `READY_R;
        end
      end else begin
        state_rom <= `READY_R;
      end
    end
  end

wire mux1;
wire mux2;
wire mux3;
wire mux4;
wire mux5;
wire mux6;
wire mux7;
wire mux8;
wire mux9;

wire tog1;
wire tog2;
wire tog3;
wire tog4;
wire tog5;
wire tog6;
wire tog7;
wire tog8;
wire tog9;

wire [8:0] mux_cov;
assign mux_cov = {tog1, tog2, tog3, tog4, tog5, tog6, tog7, tog8, tog9};
assign coverage = mux_cov;

assign mux1 = (state_sdram == `READY_S)? 1 : 0;
assign mux2 = (state_sdram == `PENDING_S1)? 1 : 0;
assign mux3 = sdram_valid;

assign mux4 = (state_flash == `READY_F)? 1 : 0;
assign mux5 = (state_flash == `PENDING_F1)? 1 : 0;
assign mux6 = flash_valid;

assign mux7 = (state_rom == `READY_R)? 1 : 0;
assign mux8 = (state_rom == `PENDING_R1)? 1 : 0;
assign mux9 = rom_valid;

saturating_counter c1(
  .clock(clock),
  .reset(reset),
  .signal(mux1),
  .toggled(tog1)
);
saturating_counter c2(
  .clock(clock),
  .reset(reset),
  .signal(mux2),
  .toggled(tog2)
);
saturating_counter c3(
  .clock(clock),
  .reset(reset),
  .signal(mux3),
  .toggled(tog3)
);
saturating_counter c4(
  .clock(clock),
  .reset(reset),
  .signal(mux4),
  .toggled(tog4)
);
saturating_counter c5(
  .clock(clock),
  .reset(reset),
  .signal(mux5),
  .toggled(tog5)
);
saturating_counter c6(
  .clock(clock),
  .reset(reset),
  .signal(mux6),
  .toggled(tog6)
);
saturating_counter c7(
  .clock(clock),
  .reset(reset),
  .signal(mux7),
  .toggled(tog7)
);
saturating_counter c8(
  .clock(clock),
  .reset(reset),
  .signal(mux8),
  .toggled(tog8)
);
saturating_counter c9(
  .clock(clock),
  .reset(reset),
  .signal(mux9),
  .toggled(tog9)
);

endmodule

module saturating_counter(
  input clock,
  input reset,

  input signal,
  output toggled
);

reg count;
reg last;

assign toggled = count;

always @(posedge clock) begin
  if (reset) begin
    count <= 0;
  end else if (last ^ signal) begin
    count <= 1;
  end

  last <= signal;
end
endmodule
