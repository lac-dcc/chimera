// This program was cloned from: https://github.com/vrteee/tt07-mini-aie-cgra
// License: Apache License 2.0

`default_nettype none

module tt_um_mini_aie_2x2 (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /* verilator lint_off UNUSEDSIGNAL */
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    /* verilator lint_on UNUSEDSIGNAL */
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire reset = !rst_n & ena;
  assign uio_oe = 8'b11111111;

  // intermediate regs between FIFOs and switches
  reg [7:0] switch_fifo_in[4];
  reg [7:0] switch_fifo_out[4];

  // intermediate regs between switches and PEs
  reg [7:0] switch_pe_out[4];
  reg [7:0] switch_pe_in[4];

  // intermediate regs between PEs
  reg [7:0] prev_pe_in[4];
  reg [7:0] next_pe_in[4];

  // control signals
  wire switch_fifo_rd_en[4];
  wire switch_fifo_wr_en[4];
  
  // generate noc and pe array
  generate
    genvar i;
    for (i = 0; i < 4; i = i + 1) begin : gen
      if (i == 0) begin
        synchronous_fifo #(
            .DEPTH(2),
            .DATA_WIDTH(8)
        ) fifo (
            .clk(clk),
            .rst_n(rst_n),
            .w_en(ena),
            .r_en(switch_fifo_rd_en[i]),
            .data_in(ui_in),
            .data_out(switch_fifo_in[i]),
            .full(),
            .empty()
        );
      end else begin
        synchronous_fifo #(
            .DEPTH(2),
            .DATA_WIDTH(8)
        ) fifo (
            .clk(clk),
            .rst_n(rst_n),
            .w_en(switch_fifo_wr_en[i-1]),
            .r_en(switch_fifo_rd_en[i]),
            .data_in(switch_fifo_out[i-1]),
            .data_out(switch_fifo_in[i]),
            .full(),
            .empty()
        );
      end

      switch #(
          .rank(i)
      ) switch (
          .clk(clk),
          .rst_n(rst_n),
          .switch_fifo_in(switch_fifo_in[i]),
          .switch_fifo_out(switch_fifo_out[i]),
          .pe_fifo_in(switch_pe_out[i]),
          .pe_fifo_out(switch_pe_in[i]),
          .rd_en(switch_fifo_rd_en[i]),
          .wr_en(switch_fifo_wr_en[i])
      );

      integer last = i == 3 ? 0 : i + 1;
      compute_tile pe (
          .clk(clk),
          .rst_n(rst_n),
          .switch_data_in(switch_pe_in[i]),
          .switch_data_out(switch_pe_out[i]),
          .prev_pe_data_in(next_pe_in[last]),
          .next_pe_data_out(next_pe_in[i]),
          .next_pe_data_in(prev_pe_in[last]),
          .prev_pe_data_out(prev_pe_in[i])
      );
    end

  endgenerate
  assign uo_out = switch_fifo_out[2];
  assign uio_out = 8'b00000000;

  always @(posedge clk or negedge rst_n) begin
    $display("------------");
    $display("uo_out: %d, uio_in[7]: %d", uo_out, uio_in[7]);
    $display("switch_fifo_out[0]: %b, switch_fifo_in[0]: %b", switch_fifo_out[0], switch_fifo_in[0]);
    $display("switch_fifo_out[1]: %b, switch_fifo_in[1]: %b", switch_fifo_out[1], switch_fifo_in[1]);
    $display("switch_fifo_out[2]: %b, switch_fifo_in[2]: %b", switch_fifo_out[2], switch_fifo_in[2]);
    $display("switch_fifo_out[3]: %b, switch_fifo_in[3]: %b", switch_fifo_out[3], switch_fifo_in[3]);
  end
  

endmodule
