// Seed: 3227196311
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input wand id_5,
    output tri id_6,
    input tri0 id_7,
    output wire id_8,
    input supply0 id_9
);
  assign (highz1, strong0) id_8 = id_3;
  id_11(
      .id_0(1),
      .id_1(1),
      .id_2(id_8 - id_4),
      .id_3(id_8),
      .id_4(1),
      .id_5(1),
      .id_6(id_1),
      .id_7(),
      .id_8(id_4),
      .id_9(id_1)
  );
  wire id_12;
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    output wand id_5,
    input tri id_6,
    input uwire id_7,
    input uwire id_8,
    input wor id_9,
    output wor id_10,
    input uwire id_11,
    input uwire id_12,
    input uwire id_13,
    input supply0 id_14,
    input tri id_15
);
  assign id_5 = 1;
  xnor primCall (
      id_10,
      id_17,
      id_2,
      id_13,
      id_1,
      id_7,
      id_8,
      id_6,
      id_11,
      id_3,
      id_15,
      id_9,
      id_14,
      id_12,
      id_4
  );
  supply1 id_17 = id_9;
  wire id_18;
  module_0 modCall_1 (
      id_0,
      id_17,
      id_6,
      id_2,
      id_2,
      id_13,
      id_5,
      id_7,
      id_17,
      id_17
  );
  assign modCall_1.id_9 = 0;
  generate
    id_19(
        .id_0(id_9 & id_6 & 1'b0), .id_1(1'b0)
    );
    supply0 id_20;
    wire id_21;
    assign id_20 = 1;
    wire id_22;
  endgenerate
  assign id_21 = id_21;
endmodule
