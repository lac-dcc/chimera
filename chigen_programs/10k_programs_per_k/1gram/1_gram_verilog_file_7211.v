// Seed: 1271146667
module module_0 (
    input wand id_0,
    output wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri0 id_8
);
  uwire id_10, id_11;
  wire id_12;
  assign id_11 = 1;
  assign id_8  = 1;
endmodule
module module_1 (
    output wor id_0,
    output tri1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input wor id_4
);
  assign id_1 = 1;
  assign id_3 = id_2;
  module_0(
      id_4, id_3, id_4, id_4, id_4, id_2, id_2, id_4, id_3
  );
endmodule
