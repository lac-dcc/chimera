// Seed: 3002599183
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    input supply1 id_6,
    output wand id_7,
    input wire id_8,
    input wire id_9
);
  wire id_11;
  assign module_1.id_6 = 0;
  wire id_12 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    output tri1 id_4,
    output uwire id_5,
    input supply1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input uwire id_13,
    input wand id_14,
    input uwire id_15,
    input wor id_16
);
  wire id_18;
  tri0 id_19;
  assign id_1 = id_0;
  wire id_20;
  xor primCall (id_4, id_18, id_14, id_13, id_2, id_3, id_6, id_12, id_21, id_19, id_8, id_0);
  id_21(
      .id_0(1),
      .id_1(1'b0),
      .id_2(1),
      .id_3(id_7),
      .id_4(id_13),
      .id_5({~id_4, id_10 ? id_6 : id_19}),
      .id_6(id_13),
      .id_7(1),
      .id_8(1),
      .id_9(1)
  );
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_19,
      id_15,
      id_14,
      id_8,
      id_3,
      id_3,
      id_14,
      id_19,
      id_14,
      id_16
  );
endmodule
