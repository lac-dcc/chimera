// Seed: 533011894
module module_0 #(
    parameter id_11 = 32'd15,
    parameter id_12 = 32'd21
) (
    output wand  id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wire  id_4,
    input  uwire id_5,
    output wire  id_6,
    input  uwire id_7,
    output wand  id_8
);
  assign id_8 = id_3;
  tri0 id_10;
  defparam id_11.id_12 = id_10;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wand id_4
);
  wire id_6;
  assign id_4 = id_0;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.type_4 = 0;
  always @(posedge id_2) $display;
endmodule
