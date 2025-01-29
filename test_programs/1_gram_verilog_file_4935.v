// Seed: 221780210
module module_0 (
    output wand id_0,
    output uwire id_1,
    input wire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wor id_5,
    input wand id_6,
    input tri0 id_7,
    output tri id_8,
    output wor id_9,
    input tri1 id_10,
    input supply0 id_11,
    id_15,
    input tri0 id_12,
    input tri0 id_13
);
  wire id_16, id_17, id_18;
  assign id_9 = 1;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    output tri id_3,
    input wire id_4,
    id_11,
    output wire id_5,
    input tri1 id_6,
    id_12,
    output uwire id_7,
    input uwire id_8,
    input uwire id_9
);
  module_0 modCall_1 (
      id_5,
      id_3,
      id_8,
      id_8,
      id_6,
      id_4,
      id_4,
      id_9,
      id_1,
      id_7,
      id_0,
      id_6,
      id_6,
      id_0
  );
  assign modCall_1.id_6 = 0;
  parameter id_13 = id_9 << 1;
  assign id_1 = 1 ? -1 : -1;
endmodule
