// Seed: 833624642
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_3 = 32'd23,
    parameter id_4 = 32'd67
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5
);
  input id_5;
  input _id_4;
  input _id_3;
  output id_2;
  input id_1;
  always @(negedge id_5) begin
    if (id_4) begin
      id_3 <= 1;
      id_1 <= 1;
      id_4 = 1'b0;
    end else begin
      if (1) begin
        id_3[id_3 : 1-{1'b0, 1}] = 1;
        id_5 <= 1;
        SystemTFIdentifier(1 * 1, 1, id_1, id_2);
        id_4 <= 1;
      end else begin
        id_5 <= id_4;
      end
    end
  end
  assign id_3 = id_4;
  logic id_6;
  assign id_1[id_4] = "" ? 1'h0 : 1 ? id_3 : 1'b0;
  assign id_3[id_4^id_4] = id_4;
endmodule
