// Seed: 3072672323
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    input tri id_5,
    input tri1 id_6,
    input wor id_7,
    input wire id_8
);
  wire id_10;
  integer id_11;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    output supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    output tri id_6
);
  reg  id_8;
  wire id_9;
  initial id_8 = #1 1 - 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
