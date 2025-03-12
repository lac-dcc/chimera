// Seed: 1024080224
module module_0 (
    input  uwire id_0,
    output tri   id_1
);
  wire id_3, id_4, id_5, id_6;
  assign id_1 = id_0;
  assign id_3 = id_6;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri id_3,
    output uwire id_4,
    output wire id_5,
    output wor id_6,
    input uwire id_7,
    input wire id_8,
    input wand id_9,
    input supply1 id_10,
    input tri0 id_11,
    output wire id_12
);
  wire id_14;
  or primCall (id_4, id_8, id_9, id_14, id_7, id_1, id_2, id_11);
  module_0 modCall_1 (
      id_8,
      id_4
  );
endmodule
