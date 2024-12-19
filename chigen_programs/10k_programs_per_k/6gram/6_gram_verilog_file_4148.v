// Seed: 3287336667
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    output tri0 id_4
    , id_31,
    input wand id_5,
    input tri id_6,
    output tri0 id_7,
    input supply0 id_8,
    output tri1 id_9,
    output wor id_10,
    input tri id_11,
    input wire id_12,
    output uwire id_13,
    input wand id_14,
    input tri0 id_15,
    input tri0 id_16,
    output wire id_17,
    input uwire id_18,
    input wor id_19,
    input uwire id_20,
    output tri0 id_21
    , id_32,
    input tri id_22,
    input wor id_23,
    input supply1 id_24,
    input uwire id_25,
    input tri1 id_26,
    output wire id_27,
    output supply1 id_28,
    output wor id_29
);
  always @("" or posedge "") id_9 = 1;
  always repeat (id_23 - id_22) id_21 = id_19;
  wire id_33;
  wor  id_34 = 1 == (1'd0);
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    output uwire id_3,
    output wor id_4
    , id_20,
    output wor id_5,
    output wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    input wire id_14,
    output tri id_15,
    output tri id_16,
    input wand id_17,
    output wor id_18
);
  reg id_21;
  module_0 modCall_1 (
      id_18,
      id_15,
      id_7,
      id_8,
      id_3,
      id_8,
      id_14,
      id_18,
      id_14,
      id_16,
      id_16,
      id_12,
      id_13,
      id_4,
      id_0,
      id_7,
      id_11,
      id_5,
      id_1,
      id_8,
      id_8,
      id_6,
      id_7,
      id_14,
      id_14,
      id_17,
      id_11,
      id_6,
      id_15,
      id_15
  );
  assign modCall_1.id_9 = 0;
  reg id_22;
  always @(id_1 or id_2) id_21 <= #1 id_22;
endmodule
