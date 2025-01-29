// Seed: 94915508
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  wor   id_2,
    input  uwire id_3,
    output tri   id_4,
    output wand  id_5
);
  wire id_7;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output uwire id_2,
    output wand id_3,
    input uwire id_4,
    input uwire id_5,
    output wire id_6
);
  wire id_8;
  supply1 id_9, id_10 = id_5;
  xor primCall (id_2, id_9, id_1, id_10, id_4);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_9,
      id_9,
      id_2
  );
endmodule
module module_2 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input supply0 id_3,
    input tri id_4
);
  assign id_6 = id_1;
  wor id_7, id_8, id_9;
  integer id_10;
  assign id_7 = 1 - 1;
  wor id_11 = -1;
  localparam id_12 = id_10;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_3,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_7 = 1'b0 == id_9;
endmodule
