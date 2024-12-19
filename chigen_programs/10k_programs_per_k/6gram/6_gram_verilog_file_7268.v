// Seed: 1567768691
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri0 id_5,
    output wand id_6,
    input wire id_7,
    input tri0 id_8,
    output tri1 id_9
);
  wire id_11;
  wire id_12;
  assign id_1 = id_12 == 1;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input tri id_2,
    output tri0 id_3,
    input supply1 id_4,
    output logic id_5,
    input supply0 id_6,
    input wire id_7,
    input tri id_8
);
  initial if (id_6) id_5 <= !id_8;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_8,
      id_3,
      id_8,
      id_3,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.type_14 = 0;
endmodule
