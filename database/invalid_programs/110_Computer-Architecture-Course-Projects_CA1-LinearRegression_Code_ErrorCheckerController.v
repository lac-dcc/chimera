// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define S0 3'd0
`define S1 3'd1
`define S2 3'd2
`define S3 3'd3
`define S4 3'd4
`define S5 3'd5

module ErrorCheckerController (
    en,
    cout,
    clk,
    rst,
    error_checker_ready,
    error_checker_done,
    h_ld
);

  input en, cout, clk, rst;

  output reg error_checker_ready, error_checker_done, h_ld;

  reg [2:0] ns, ps;
  reg [0:0] waiting_clk;
  reg wait_2_clk;

  always @(posedge clk) begin
    ns <= `S0;
    error_checker_ready <= 1'b0;
    error_checker_done <= 1'b0;

    case (ps)
      `S0 : begin
        ns = (en == 1'b1) ? `S1 : `S0;
        error_checker_done <= 1'b1;
        wait_2_clk <= 1'b0;
      end
      `S1 : begin
        ns = (en == 1'b1) ? `S1 : `S2;
        wait_2_clk <= 1'b0;
      end
      `S2 : begin
        ns = (cout == 1'b0) ? `S3 : `S0;
        error_checker_ready <= 1'b1;
        wait_2_clk <= 1'b0;
      end
      `S3 : begin
        if (wait_2_clk) waiting_clk = (waiting_clk + 1'b1) % 2;
        ns = (waiting_clk == 1'b0 && wait_2_clk == 1'b1) ? `S4 : `S3;
        wait_2_clk = 1'b1;
      end
      `S4 : begin
        ns = `S5;
        h_x_ld <= 1'b1;
      end
      `S5 : begin
        ns = `S2;
      end
    endcase
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin 
      ps <= `S0;
      waiting_clk <= 1'b0;
    end
    else ps <= ns;
  end
endmodule
