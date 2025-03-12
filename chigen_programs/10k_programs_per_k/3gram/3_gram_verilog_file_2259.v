// Seed: 383586796
module module_0 (
    input tri id_0,
    input wand id_1,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input uwire id_8,
    output wand id_9,
    input tri1 id_10
);
  int id_12;
  ;
  wire id_13;
  assign id_13 = !id_1;
  wire id_14;
  assign module_1.id_0 = 0;
  assign id_12 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    input tri id_2,
    output supply0 id_3,
    input supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_3,
      id_2,
      id_3,
      id_4
  );
endmodule
