// Seed: 1037065968
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output tri id_2,
    output wand id_3,
    input tri id_4,
    input tri0 id_5,
    input uwire id_6
    , id_10,
    input wor id_7,
    input wire id_8
);
  wire  id_11 = id_4;
  logic id_12;
  logic id_13;
  logic id_14;
endmodule
module module_1 (
    input  tri  id_0,
    input  tri  id_1,
    input  wand id_2,
    output wire id_3
);
  wire id_5;
  wire id_6;
  xor primCall (id_3, id_1, id_6, id_5, id_0);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
