// Seed: 3004715725
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output wire id_2,
    input uwire id_3,
    input tri id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input tri1 id_8
);
  assign id_0 = id_4;
  wand  id_10 = id_5;
  uwire id_11, id_12 = {1, 1 << 1'b0};
  id_13(
      .id_0(id_3),
      .id_1(id_4),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .min(1 == id_10),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_1),
      .id_8(id_1 == 1),
      .id_9(id_12)
  );
  supply0 id_14;
  assign id_2 = id_12;
  integer id_15;
  uwire id_16 = id_8;
  wire id_17;
  wor id_18 = id_14 < id_5;
  wire id_19;
  assign id_0 = 1 != 1'b0 ? id_17 : id_17;
  wire id_20;
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    output supply1 id_5,
    output tri id_6,
    input tri1 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input tri id_10,
    input tri1 id_11,
    output wor id_12,
    input wand sample,
    output supply1 id_14,
    input supply0 id_15
    , id_27,
    output tri0 module_1,
    output supply1 id_17,
    input uwire id_18,
    input wire id_19,
    input wand id_20,
    output tri id_21,
    input tri0 id_22,
    output supply0 id_23,
    output tri id_24
    , id_28,
    output uwire id_25
    , id_29
);
  wire id_30;
  module_0 modCall_1 (
      id_24,
      id_22,
      id_12,
      id_1,
      id_11,
      id_2,
      id_2,
      id_22,
      id_3
  );
  wire id_31;
  or primCall (
      id_5,
      id_3,
      id_2,
      id_27,
      id_29,
      id_15,
      id_22,
      id_19,
      id_1,
      id_28,
      id_4,
      id_30,
      id_11,
      id_8,
      id_18,
      id_20,
      id_10,
      id_7
  );
  always @(negedge 1'd0 * id_3) id_23 = 1;
  initial if (id_7) id_9 = 1;
  assign id_25 = 1 != 1;
endmodule
