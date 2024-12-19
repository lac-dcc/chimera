// Seed: 2298134052
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri1 id_3#(.id_8(id_8)),
    input tri id_4,
    output supply0 id_5,
    input tri0 id_6
);
  wire id_9;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input tri0 id_2,
    output wand id_3,
    output tri0 id_4,
    input wand id_5,
    output uwire id_6,
    input tri0 id_7,
    output supply1 id_8,
    input tri1 id_9
);
  uwire id_11;
  assign id_3 = (id_5);
  assign id_8 = id_5#(1, 1 & 1);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_6,
      id_11
  );
  assign modCall_1.id_8 = 0;
  assign id_11 = "" ? 1 : 1;
  assign id_8 = id_11;
endmodule
