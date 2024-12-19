// Seed: 2149549751
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input wand id_4,
    output tri0 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input wire id_8
    , id_10
);
  wire id_11;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    output tri0 id_7,
    output wor id_8,
    input tri1 id_9
);
  or primCall (id_8, id_0, id_3, id_9, id_5);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
