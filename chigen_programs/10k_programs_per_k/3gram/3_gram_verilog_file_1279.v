// Seed: 1177446334
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output uwire id_2,
    input wand id_3,
    output tri0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri id_8,
    output supply0 id_9
);
  id_11(
      .id_0(1), .id_1(1)
  );
  assign id_9 = id_6;
  wire id_12;
  wire id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  wire id_21;
  wor  id_22 = id_6;
  wire id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32 = id_21;
  wire id_33, id_34 = id_27, id_35, id_36, id_37, id_38, id_39, id_40;
  always @(*) id_35 = id_34;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    output uwire id_7,
    output wand id_8,
    output supply1 id_9,
    output supply0 id_10
);
  nand primCall (id_10, id_6, id_0, id_2, id_5, id_4, id_1, id_3);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_7,
      id_2,
      id_7,
      id_9,
      id_6,
      id_6,
      id_10,
      id_10
  );
endmodule
