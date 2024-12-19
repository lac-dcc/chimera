// Seed: 85733094
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri id_6,
    input wand id_7,
    input tri0 id_8,
    output wand id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    input supply1 id_14,
    input tri id_15,
    output supply1 id_16,
    output tri0 id_17,
    input tri id_18,
    output wire id_19
);
  wire id_21;
  id_22(
      id_19, 1, 1 && id_1, 1
  );
  assign id_19 = 'b0;
  assign module_1.type_3 = 0;
  wire id_23;
endmodule
module module_1 (
    input  tri   id_0,
    output wor   id_1,
    input  wor   id_2,
    output uwire id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
