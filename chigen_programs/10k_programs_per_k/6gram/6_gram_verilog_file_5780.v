// Seed: 1149756180
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_9;
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd8
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_2,
      id_1,
      id_2,
      id_6,
      id_1
  );
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  assign id_2 = id_8;
  wire [id_3 : 1] id_9;
  always force id_9 = 1 - id_6;
endmodule
