// Seed: 793680179
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    inout wire id_5,
    input tri1 id_6,
    input tri0 id_7,
    output uwire id_8,
    output tri id_9,
    output wor id_10,
    output supply1 id_11,
    input tri id_12,
    output supply1 id_13,
    output supply0 id_14,
    input wand id_15,
    output wor id_16,
    output uwire id_17,
    output tri id_18
    , id_31,
    input tri0 id_19,
    input tri id_20,
    output wire id_21,
    input tri0 id_22,
    output tri1 id_23,
    output wire id_24,
    output wand id_25,
    output tri id_26,
    output tri id_27,
    output wire id_28,
    output uwire id_29
);
  assign id_28 = 1;
  wire id_32;
  wire id_33, id_34;
  assign id_27 = 1;
  wire id_35;
  wire id_36;
  assign module_1.id_4 = 0;
  assign #1 id_23 = 1'b0 * 1'h0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input tri id_2,
    inout tri0 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wor id_6,
    output tri1 id_7,
    input tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    input tri0 id_12,
    input wire id_13,
    output wire id_14,
    input wand id_15
    , id_28,
    input tri0 id_16,
    input supply0 id_17,
    output supply1 id_18,
    input wand id_19,
    input tri1 id_20,
    output supply0 id_21,
    input wire id_22,
    output tri0 id_23,
    input tri1 id_24,
    input tri0 id_25,
    output wor id_26
);
  assign id_9 = 1 + id_17;
  or primCall (
      id_18,
      id_19,
      id_17,
      id_15,
      id_12,
      id_24,
      id_4,
      id_22,
      id_2,
      id_1,
      id_13,
      id_20,
      id_28,
      id_5,
      id_8,
      id_11,
      id_3,
      id_16,
      id_10,
      id_6
  );
  module_0 modCall_1 (
      id_8,
      id_26,
      id_3,
      id_1,
      id_9,
      id_3,
      id_3,
      id_20,
      id_18,
      id_26,
      id_7,
      id_23,
      id_3,
      id_9,
      id_9,
      id_17,
      id_7,
      id_14,
      id_21,
      id_12,
      id_4,
      id_26,
      id_20,
      id_26,
      id_3,
      id_26,
      id_23,
      id_21,
      id_7,
      id_18
  );
endmodule
