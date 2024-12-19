// Seed: 2554081002
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input wor id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input wire id_6,
    output supply1 id_7,
    output wor id_8,
    input uwire id_9,
    output wire id_10,
    output tri id_11,
    output wand id_12,
    input tri0 id_13,
    input wand id_14,
    input tri1 id_15,
    output wand id_16,
    output tri0 id_17,
    input tri id_18,
    input wor id_19,
    input wor id_20,
    input supply1 id_21,
    input tri0 id_22,
    output wor id_23,
    input tri id_24,
    input supply1 id_25,
    output uwire id_26,
    output wor void id_27,
    input tri1 id_28,
    input wand id_29,
    output uwire id_30,
    output tri1 id_31
);
  wire id_33;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    output supply1 id_3 id_25,
    input wand id_4,
    output wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wire id_8,
    output tri1 id_9,
    inout tri0 id_10,
    output supply0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    input tri id_14,
    output tri0 id_15,
    input uwire id_16,
    input uwire id_17,
    input tri0 id_18,
    input wor id_19,
    output tri1 id_20,
    input uwire id_21,
    input uwire id_22,
    output tri id_23
);
  wand id_26;
  final $display(1, 1'b0, 1, 1 <= id_17, 1);
  always
    if (|id_2) id_9 = 1 * id_18 ^ 1'b0;
    else @(*) id_20 = 1;
  assign id_26 = id_4.id_17;
  wire id_27 = id_1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_26,
      id_22,
      id_27,
      id_19,
      id_16,
      id_25,
      id_10,
      id_7,
      id_20,
      id_27,
      id_11,
      id_2,
      id_2,
      id_25,
      id_26,
      id_3,
      id_14,
      id_18,
      id_0,
      id_13,
      id_4,
      id_11,
      id_8,
      id_19,
      id_9,
      id_26,
      id_8,
      id_0,
      id_15,
      id_26
  );
endmodule
