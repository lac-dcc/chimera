// Seed: 4069539550
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output wire id_6,
    input supply0 id_7,
    input wor id_8
);
  wire id_10;
endmodule
module module_1 (
    input  tri1 id_0,
    output wand id_1,
    input  wand id_2,
    input  tri0 id_3,
    output wand id_4
    , id_6
);
  assign id_6 = {1'd0, id_2};
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
