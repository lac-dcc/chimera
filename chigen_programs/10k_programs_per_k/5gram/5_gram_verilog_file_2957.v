// Seed: 3161226972
module module_0 (
    output wor id_0,
    output wand id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input uwire id_6,
    output supply1 id_7,
    input supply1 id_8,
    input uwire id_9,
    input wor id_10,
    output uwire id_11
);
  wire id_13;
  wire id_14;
  supply0 id_15 = id_10;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    output tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wand id_5,
    input tri1 id_6
);
  always @(negedge id_6) id_2 = id_0;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_0,
      id_3,
      id_2,
      id_1,
      id_5,
      id_0,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = 1'b0;
  tri1 id_8;
  assign id_8 = 1'b0;
  wire id_9;
  wire id_10, id_11, id_12, id_13;
  wire id_14;
endmodule
