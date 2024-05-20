// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

module top #(
    parameter NUM_ANT = 24
) (
    input clk16,
    input [NUM_ANT-1:0] in_radio_i,
    input [NUM_ANT-1:0] in_radio_q
);

  genvar ant;

  wire [NUM_ANT-1:0] all_i;
  wire [NUM_ANT-1:0] all_q;

  generate
    for (ant = 0; ant < NUM_ANT; ant = ant + 1) begin
      radio_dummy #(
          .ANT_NUM(ant)
      ) r0 (
          .clk16(clk16),
          .rst_n(1'b1),
          .i1(in_radio_i[ant]),
          .q1(in_radio_q[ant]),
          .data_i(all_i[ant]),
          .data_q(all_q[ant])
      );
    end
  endgenerate

endmodule

// Basic input module from a Max2769
module radio_all_tb ();

  reg clk16 = 0;
  reg [23:0] data_i = 0;
  reg [23:0] data_q = 0;

  top #(
      .NUM_ANT(24)
  ) dut (
      .clk16(clk16),
      .in_radio_i(data_i),
      .in_radio_q(data_q)
  );

  always #1 clk16 = !clk16;

  initial begin
    $monitor("i=%b, q=%b", dut.all_i, dut.all_q);
    #300 $finish();
  end

endmodule
