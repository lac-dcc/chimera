// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module visfinal_tb;

  localparam integer IBITS = 5;
  localparam integer ISB = IBITS - 1;

  localparam integer OBITS = 8;
  localparam integer OSB = OBITS - 1;

  localparam integer ABITS = 2;
  localparam integer ASB = ABITS - 1;
  localparam integer NSUMS = 1 << ABITS;

  localparam integer SBITS = OBITS - IBITS;
  localparam integer SSB = SBITS - 1;

  reg clock = 1'b1;
  reg rst_n = 1'bx;

  reg start = 1'b0;
  reg done = 1'b1;

  always #5 clock <= ~clock;

  initial begin
    $dumpfile("visfinal_tb.vcd");
    $dumpvars;

    #15 rst_n <= 1'b0;
    #60 rst_n <= 1'b1;

    #20 start <= 1'b1;
    #10 start <= 1'b0;

    #10 while (!done) #10;

    #80 $finish;
  end


  // -- Generate fake data -- //

  reg vld_r;
  reg fst_r;
  reg lst_r;
  reg [ISB:0] dat_r;

  reg [ASB:0] sel;
  reg [SSB:0] cnt;

  wire [SSB:0] nxt = cnt + 1;
  wire go_w = start || !done;


  always @(posedge clock) begin
    if (!rst_n) begin
      vld_r <= 1'b0;
      fst_r <= 1'b0;
      lst_r <= 1'b0;
      sel   <= {ABITS{1'b0}};
      cnt   <= {SBITS{1'b0}};
      done  <= 1'b1;
    end else begin
      // Start/stop logic for the fake data
      if (start) begin
        done <= 1'b0;
      end else if (!done) begin
        sel <= sel + 1;
        if (sel == {ABITS{1'b1}}) begin
          cnt <= cnt + 1;
          if (cnt == {SBITS{1'b1}}) begin
            done <= 1'b1;
          end
        end
      end

      // Interleaved, source partial-visibilities and their control signals
      vld_r <= go_w;
      if (start) begin
        fst_r <= 1'b1;
      end else if (sel == {ABITS{1'b1}}) begin
        fst_r <= 1'b0;
      end
      lst_r <= nxt == {SBITS{1'b0}} && !done;

      if (go_w) begin
        dat_r <= $urandom;
      end else begin
        dat_r <= {IBITS{1'bx}};
      end
    end
  end


  // -- Module Under Test -- //

  wire vld_w, fst_w, lst_w;
  wire [7:0] dat_w;

  visfinal #(
      .IBITS(IBITS),
      .OBITS(OBITS),
      .NSUMS(NSUMS),
      .ABITS(ABITS)
  ) VISFINAL0 (
      .clock (clock),
      .reset(~rst_n),

      .valid_i(vld_r),
      .first_i(fst_r),
      .last_i (lst_r),
      .data_i (dat_r),

      .valid_o(vld_w),
      .first_o(fst_w),
      .last_o (lst_w),
      .data_o (dat_w)
  );

endmodule  // visfinal_tb
