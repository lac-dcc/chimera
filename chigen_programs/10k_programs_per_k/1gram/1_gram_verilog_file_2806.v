// Seed: 655126818
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    input tri id_7,
    input wor id_8,
    input tri1 id_9,
    input tri id_10
);
  assign id_0 = 1;
  wand id_12;
  assign id_12 = 1;
  supply1 id_13;
  wire id_14, id_15;
  wire id_16;
  assign id_13 = id_6;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    input tri0 id_5,
    output uwire id_6
);
  assign id_6 = 1;
  wire id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_13 = 0;
endmodule
