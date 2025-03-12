// Seed: 2690214661
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    module_0,
    id_14
);
  inout wand id_14;
  inout wire id_13;
  output tri id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_14 = -1;
  wire id_15;
  wire id_16;
  ;
  assign id_12 = -1'b0 < id_5;
endmodule
module module_1 #(
    parameter id_1 = 32'd22,
    parameter id_2 = 32'd99
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wand id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  nand primCall (id_6, id_3, id_5, id_7);
  inout wire id_3;
  inout wire _id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_3,
      id_4,
      id_3,
      id_6,
      id_7,
      id_7,
      id_5,
      id_8,
      id_7,
      id_4,
      id_6,
      id_6
  );
  logic [7:0][(  id_2  ) : id_1] id_9;
  wire [id_1  -  -1 : -1] id_10;
  assign id_8 = id_3 ? id_10 === id_1 - -1 : id_9 | id_9[1];
endmodule
