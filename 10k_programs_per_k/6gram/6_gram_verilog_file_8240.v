// Seed: 1990346104
`timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout id_5;
  input id_4;
  output id_3;
  inout id_2;
  input id_1;
  logic id_5;
  logic id_6;
  logic id_7 = id_5 > id_4;
  always @(posedge id_5) begin
    #1 id_3 = id_4;
  end
  logic id_8;
  logic id_9;
  logic id_10 = 1;
  assign id_8 = 1;
  generate
    if (id_5)
      if (id_4) begin : id_11
        assign id_9 = 1'b0 - 1 ? 1 : id_8;
      end else if ((1))
        always @(posedge id_10 > 1) begin
          id_2 <= 1'b0;
        end
      else begin
        logic id_12;
      end
  endgenerate
endmodule
