// Seed: 1579100824
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri id_4,
    output wor id_5,
    output supply1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    output wand id_9,
    output wor id_10
);
  wire id_12;
  wire id_13;
  wire id_14;
  supply0 id_15 = id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    output tri id_2
);
  wor id_4;
  buf primCall (id_0, id_4);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.id_10 = 0;
  wire id_5;
  wire id_6;
  tri0 id_7 = 1;
  wire id_8;
  wire id_9;
endmodule
