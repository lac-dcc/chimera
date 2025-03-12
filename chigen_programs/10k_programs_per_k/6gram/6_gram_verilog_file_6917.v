// Seed: 3178924396
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input wor id_2,
    output tri0 id_3,
    input tri id_4,
    output wor id_5,
    input tri id_6,
    input wand id_7,
    input supply0 id_8,
    input tri id_9,
    input tri0 id_10,
    output wand id_11,
    input tri id_12,
    output wire id_13
);
  wire id_15;
  assign id_15 = id_0;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    input wand id_2,
    output tri id_3,
    input tri0 id_4,
    output tri id_5,
    input wire id_6,
    output supply0 id_7,
    inout tri id_8
);
  module_0 modCall_1 (
      id_4,
      id_8,
      id_4,
      id_8,
      id_4,
      id_3,
      id_6,
      id_6,
      id_6,
      id_2,
      id_8,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
