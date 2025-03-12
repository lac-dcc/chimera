// Seed: 3393085306
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input uwire id_2,
    output wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    input uwire id_6,
    input wand id_7,
    output wire id_8,
    input tri0 id_9,
    input wor id_10
);
  wire  id_12;
  logic id_13;
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input wor id_2,
    output wire id_3,
    input wire id_4,
    input supply1 id_5,
    output wand id_6,
    input supply0 id_7,
    input uwire id_8
);
  integer id_10;
  ;
  xor primCall (id_3, id_5, id_2, id_7, id_0, id_8, id_12);
  localparam [1 : 1] id_11 = 1, id_12 = 1 !=? id_11, id_13 = -1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_6,
      id_7,
      id_8,
      id_8,
      id_8,
      id_3,
      id_7,
      id_1
  );
endmodule
