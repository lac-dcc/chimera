// Seed: 3571625876
module module_0 (
    input wor id_0,
    inout tri0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    output supply0 id_6,
    output uwire id_7,
    output tri0 id_8,
    output uwire id_9,
    output tri1 id_10,
    input tri0 id_11,
    input supply1 id_12,
    output wor id_13,
    output supply1 id_14,
    id_18,
    input supply1 id_15,
    input supply1 id_16
);
  supply0 id_19, id_20 = -1'b0;
  assign id_8 = id_11;
  wire id_21;
  tri0 id_22;
  wire id_23, id_24, id_25;
  assign id_18 = 1;
  wire id_26;
  assign id_22 = -1'd0;
  wire id_27;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input uwire id_3,
    inout tri0 id_4,
    output wand id_5,
    output tri0 id_6
);
  wire id_8;
  nor primCall (id_5, id_8, id_2, id_4);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_0,
      id_3,
      id_4,
      id_5,
      id_6,
      id_6,
      id_5,
      id_4,
      id_0,
      id_3,
      id_6,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
