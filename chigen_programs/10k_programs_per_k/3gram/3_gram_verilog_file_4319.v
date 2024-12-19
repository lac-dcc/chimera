// Seed: 1798999821
module module_0 #(
    parameter id_11 = 32'd90,
    parameter id_12 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_11.id_12 = 1;
  assign id_4 = {1, id_6};
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    output wor   id_6,
    input  uwire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_4 = 0;
  wire id_10;
  nor primCall (id_6, id_7, id_5, id_3, id_9);
endmodule
