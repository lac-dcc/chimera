// Seed: 748278619
module module_0 (
    output wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri1 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input wand id_11,
    output wor id_12,
    input tri0 id_13
);
  tri0 id_15;
  wire id_16;
  always @(negedge id_17) begin : LABEL_0
    `define pp_18 0
    #id_19;
  end
  id_20(
      .id_0(1),
      .id_1(id_15),
      .id_2(id_0),
      .id_3(),
      .id_4(id_8),
      .id_5(id_15),
      .id_6(id_1),
      .id_7(id_2),
      .id_8(1 + 1 * 1 - id_15),
      .id_9(1),
      .id_10("")
  );
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5,
    output tri id_6,
    output supply1 id_7,
    output uwire id_8,
    output supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    input tri id_12,
    input supply0 id_13,
    output uwire id_14,
    output supply0 id_15,
    output wor id_16,
    input wand id_17,
    input tri0 id_18,
    output wor id_19,
    input tri1 id_20,
    input supply0 id_21
);
  wire id_23;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_13,
      id_10,
      id_11,
      id_0,
      id_13,
      id_19,
      id_19,
      id_9,
      id_11,
      id_21,
      id_7,
      id_20
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = 1'b0;
endmodule
