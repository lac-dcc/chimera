// Seed: 1366681765
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input uwire id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input uwire id_9,
    output supply1 id_10,
    output tri1 id_11,
    output supply1 id_12,
    input wire id_13,
    input tri1 id_14,
    input uwire id_15,
    input tri id_16
);
  assign id_1 = id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input supply1 id_2,
    output supply1 id_3,
    output supply1 id_4,
    output tri id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8,
    output wire id_9
);
  parameter id_11 = 1'b0;
  wire id_12, id_13, id_14, id_15;
  xor primCall (id_4, id_11, id_2, id_1, id_6, id_14, id_12, id_13, id_7, id_8, id_15);
  module_0 modCall_1 (
      id_8,
      id_3,
      id_7,
      id_6,
      id_2,
      id_2,
      id_7,
      id_8,
      id_4,
      id_6,
      id_9,
      id_4,
      id_3,
      id_8,
      id_8,
      id_1,
      id_2
  );
endmodule
