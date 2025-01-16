// Seed: 3350481062
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output tri1 id_2,
    output tri0 id_3,
    output wand id_4,
    output uwire id_5,
    output supply1 id_6,
    output wand id_7,
    input tri0 id_8
);
  wire id_10;
  wire id_11;
  wire id_12;
  wand id_13, id_14, id_15 = id_8;
  assign id_2 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1
);
  supply1 id_3;
  always id_0 = id_3;
  uwire id_4 = id_4 >> 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3
  );
  assign id_3 = 1;
endmodule
