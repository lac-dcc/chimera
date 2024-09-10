// Seed: 3286305999
`timescale 1ps / 1ps
module module_0 #(
    parameter id_3 = 32'd28,
    parameter id_9 = 32'd29
) (
    input id_2,
    input _id_3,
    output id_4,
    input id_5,
    input logic id_6,
    input logic id_7,
    input id_8,
    input _id_9
);
  logic id_10, id_11;
  reg   id_12;
  logic id_13;
  always @(posedge id_1) begin
    id_5 = 1;
  end
  type_21(
      id_8[id_9 : 1], id_3, 1
  );
  logic id_14;
  type_23(
      1, id_5, 1 == 1
  ); type_24(
      id_5, !id_2, 1
  );
  assign id_13   = id_14;
  assign id_5[1] = id_7[id_3];
  type_25(
      1, 1, id_13[1'b0 : 1]
  ); type_26(
      id_5 & id_4, 1, SystemTFIdentifier(1)
  );
  assign id_2 = 1;
  logic id_15;
  always @(posedge 1) if (1) id_12 <= id_9;
endmodule
