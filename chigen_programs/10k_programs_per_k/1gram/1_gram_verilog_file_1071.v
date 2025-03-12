// Seed: 3066152663
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout supply0 id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = id_3, id_5 = 'd0;
  logic id_7 = id_7;
endmodule
module module_1 #(
    parameter id_2 = 32'd58,
    parameter id_5 = 32'd70
) (
    id_1,
    _id_2[id_2 : 1],
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire _id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_7,
      id_7,
      id_6,
      id_6
  );
  inout logic [7:0] id_3;
  inout logic [7:0] _id_2;
  input logic [7:0] id_1;
  logic id_11 = -1;
  assign id_6 = id_7;
  assign id_3[1] = id_1[id_5];
  assign id_11#(
      .id_1(1),
      .id_2(1)
  ) = 1'b0;
endmodule
