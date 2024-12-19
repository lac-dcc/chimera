// Seed: 1636215046
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    output supply0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    input supply0 id_9,
    input wand id_10,
    inout wor id_11,
    input wor id_12,
    input wire id_13,
    input wor id_14,
    output wor id_15,
    output tri0 id_16,
    output supply0 id_17,
    input tri id_18,
    input tri0 id_19,
    input supply0 id_20,
    input supply1 id_21,
    input supply0 id_22,
    input supply0 id_23,
    input wand id_24,
    input uwire id_25,
    output supply0 id_26
);
  id_28(
      .id_0(1),
      .id_1(id_8),
      .id_2(id_11),
      .id_3(id_7),
      .id_4(1 == 1'b0),
      .id_5(1'h0 == id_3),
      .id_6(1'd0),
      .id_7(id_17),
      .id_8(1),
      .id_9(1)
  ); id_29(
      .id_0(id_13), .id_1(1)
  );
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    output uwire id_2,
    input tri0 id_3,
    input wor id_4,
    output tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input wire id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11,
    input wire id_12,
    input tri1 id_13,
    inout tri0 id_14,
    output supply1 id_15
);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_10,
      id_1,
      id_3,
      id_11,
      id_4,
      id_14,
      id_14,
      id_12,
      id_14,
      id_6,
      id_10,
      id_9,
      id_1,
      id_5,
      id_14,
      id_8,
      id_12,
      id_3,
      id_13,
      id_8,
      id_3,
      id_4,
      id_13,
      id_14
  );
  id_17(
      .id_0(id_10 == id_4), .id_1(id_0), .id_2(id_8), .id_3(1), .id_4(1), .id_5(id_8), .id_6(id_14)
  );
  wire id_18;
  always force id_7 = 1'b0;
endmodule
