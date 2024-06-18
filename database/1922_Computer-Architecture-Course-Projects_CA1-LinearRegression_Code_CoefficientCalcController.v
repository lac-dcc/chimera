// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define S0 5'd0
`define S1 5'd1
`define S2 5'd2
`define S3 5'd3
`define S4 5'd4
`define S5 5'd5
`define S6 5'd6
`define S7 5'd7
`define S8 5'd8
`define S9 5'd9
`define S10 5'd10
`define S11 5'd11
`define S12 5'd12
`define S13 5'd13
`define S14 5'd14
`define S15 5'd15
`define S16 5'd16
`define S17 5'd17
`define S18 5'd18
`define S19 5'd19
`define S20 5'd20

module CoefficientCalcController (
    en,
    cout,
    clk,
    rst,
    coeff_ready,
    coeff_done,
    sel1,
    sel2,
    sel3,
    sel4,
    sel5,
    mean_x_ld,
    mean_y_ld,
    sum_xx_ld,
    sum_xy_ld,
    b1_ld,
    b0_ld
);

  input en, cout, clk, rst;
  output reg
    coeff_ready, coeff_done, sel1, sel2,
    sel3, sel4, sel5, mean_x_ld, mean_y_ld,
    sum_xx_ld, sum_xy_ld, b1_ld, b0_ld;

  reg [4:0] ns, ps;
  reg wait_2_clk;
  reg [0:0] waiting_counter = 1'b0;

  always @(ps, en, cout, waiting_counter) begin
    ns = `S0;
    coeff_ready = 1'b0;
    coeff_done = 1'b0;
    sel1 = 1'b0;
    sel2 = 1'b0;
    sel3 = 1'b0;
    sel4 = 1'b0;
    sel5 = 1'b1;
    mean_x_ld = 1'b0;
    mean_y_ld = 1'b0;
    sum_xx_ld = 1'b0;
    sum_xy_ld = 1'b0;
    b1_ld = 1'b0;
    b0_ld = 1'b0;

    case (ps)
      `S0: begin
        coeff_done = 1'b1;
        wait_2_clk = 1'b0;
        ns = (en == 1'b1) ? `S1 : `S0;
      end
      `S1: begin
        wait_2_clk = 1'b0;
        ns = (en == 1'b1) ? `S1 : `S2;
      end
      `S2: begin
        coeff_ready = 1'b1;
        wait_2_clk  = 1'b0;
        ns = (cout == 1'b1) ? `S17 : `S16;
      end
      `S3: begin
        sel1 = 1'b0;
        sel2 = 1'b0;
        sel3 = 1'b0;
        wait_2_clk = 1'b0;
        ns = `S4;
      end
      `S4: begin
        mean_x_ld = 1'b1;
        sum_xx_ld = 1'b1;
        sel1 = 1'b0;
        sel2 = 1'b0;
        sel3 = 1'b0;
        wait_2_clk = 1'b0;
        ns = `S5;
      end
      `S5: begin
        sel1 = 1'b1;
        sel2 = 1'b1;
        sel3 = 1'b0;
        wait_2_clk = 1'b0;
        ns = `S6;
      end
      `S6: begin
        mean_y_ld = 1'b1;
        sum_xy_ld = 1'b1;
        sel1 = 1'b1;
        sel2 = 1'b1;
        sel3 = 1'b0;
        wait_2_clk = 1'b0;
        ns = `S2;
      end
      `S7: begin
        sel4 = 1'b0;
        wait_2_clk = 1'b0;
        ns = `S8;
      end
      `S8: begin
        sel4 = 1'b0;
        ns = (waiting_counter == 1'b0 && wait_2_clk == 1'b1) ? `S9 : `S8;
        wait_2_clk = 1'b1;
      end
      `S9: begin
        sel4 = 1'b0;
        sum_xx_ld = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S10;
      end
      `S10: begin
        sel4 = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S11;
      end
      `S11: begin
        sel4 = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S12;
      end
      `S12: begin
        sel4 = 1'b1;
        sum_xy_ld = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S13;
      end
      `S13: begin
        b1_ld = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S14;
      end
      `S14: begin
        ns = (waiting_counter == 1'b0 && wait_2_clk == 1'b1) ? `S15 : `S14;
        wait_2_clk = 1'b1;
      end
      `S15: begin
        b0_ld = 1'b1;
        wait_2_clk = 1'b0;
        ns = `S0;
      end
      `S16: begin
        ns = (waiting_counter == 1'b0 && wait_2_clk == 1'b1) ? `S3 : `S16;
        wait_2_clk = 1'b1;
      end
      `S17: begin
        ns = `S18;
        sel5 = 1'b0;
        sel1 = 1'b0;
      end
      `S18: begin
        ns = `S19;
        sel5 = 1'b0;
        sel1 = 1'b0;
        mean_x_ld = 1'b1;
      end
      `S19: begin
        ns = `S20;
        sel5 = 1'b0;
        sel1 = 1'b1;
      end
      `S20: begin
        ns = `S7;
        sel5 = 1'b0;
        sel1 = 1'b1;
        mean_y_ld = 1'b1;
      end
    endcase
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ps <= `S0;
      waiting_counter = 1'b0;
    end 
    else ps <= ns;
    if (wait_2_clk) waiting_counter = (waiting_counter + 1'b1) % 2;
  end

endmodule
