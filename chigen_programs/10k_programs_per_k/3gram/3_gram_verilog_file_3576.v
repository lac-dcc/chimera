// Seed: 3565430344
module module_0 (
    output wire id_0,
    input wire id_1,
    input wire id_2,
    input tri0 id_3,
    input wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wor id_7,
    output wire id_8,
    output tri0 id_9,
    input supply0 id_10,
    output tri1 id_11,
    input wand id_12,
    output uwire id_13
);
  assign id_8 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wire id_6,
    input uwire id_7
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4,
      id_5,
      id_5,
      id_6,
      id_0,
      id_3,
      id_0,
      id_5,
      id_6
  );
  assign modCall_1.id_13 = 0;
endmodule
