// Seed: 3623125304
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    input wor id_3,
    input supply0 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    inout wand id_9,
    input wand id_10,
    input wire id_11,
    input wor id_12,
    input supply0 id_13,
    input wand id_14,
    input tri1 id_15,
    input wor id_16,
    input uwire id_17
);
  assign id_9 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    inout wor id_2,
    inout tri id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6
);
  xnor primCall (id_3, id_5, id_6, id_2, id_4, id_0);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_3,
      id_5,
      id_0,
      id_2,
      id_2,
      id_3,
      id_2,
      id_6,
      id_0,
      id_2,
      id_6,
      id_2,
      id_3
  );
  assign modCall_1.id_14 = 0;
endmodule
