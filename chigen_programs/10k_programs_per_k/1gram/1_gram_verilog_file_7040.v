// Seed: 1259496780
module module_0 (
    input wand id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input wand id_6
);
  tri1 id_8 = 1;
  wire id_9;
  id_10(
      id_3, 1, 1, id_1, 1, 1, id_3, id_0
  );
  assign id_8 = id_6;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    output uwire id_4
);
  wire id_6, id_7;
  wire id_8;
  assign id_0 = id_2;
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1
  );
endmodule
