// Seed: 4186068056
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_5 = 1;
endmodule
module module_1 #(
    parameter id_14 = 32'd12,
    parameter id_7  = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14
);
  input wire _id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  xor primCall (id_4, id_8, id_11, id_13, id_3, id_6, id_2);
  output wire id_10;
  output logic [7:0] id_9;
  inout logic [7:0] id_8;
  inout wire _id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3
  );
  assign id_9[id_14] = 1;
  wire [id_14 : -1] id_15;
  parameter id_16 = -1 + 1'd0 == "";
  assign id_2[id_7] = id_14;
  assign id_1 = id_8[1'd0];
  assign id_6[1] = 1'b0;
endmodule
