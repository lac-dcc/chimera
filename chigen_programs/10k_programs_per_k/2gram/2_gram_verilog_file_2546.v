// Seed: 1824724748
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output wire id_2,
    output wire id_3,
    input wire id_4,
    output wand id_5,
    input uwire id_6,
    input wire id_7,
    output supply1 id_8,
    input tri1 id_9,
    output tri id_10,
    input supply1 id_11,
    input wor id_12,
    input wor id_13
    , id_20,
    output tri1 id_14,
    inout wand id_15,
    input tri1 id_16,
    input wor id_17,
    input wor id_18
);
  wand id_21;
  assign id_21 = id_20 ? {id_13, id_15 + id_13, {id_21 - 1{-1}}, id_17, -1 & id_11 & 1'b0, !1} : -1;
endmodule
macromodule module_1 (
    output wire id_0,
    input tri0 id_1,
    input uwire id_2,
    input wire id_3,
    output supply1 id_4,
    output tri id_5,
    output tri1 id_6,
    input wire id_7,
    input tri0 id_8,
    output supply1 id_9,
    output wand id_10,
    inout wor id_11,
    input wire id_12,
    inout wor id_13,
    input tri id_14,
    output supply0 id_15,
    input wor id_16,
    input supply0 id_17,
    input supply0 id_18
    , id_21,
    input supply0 id_19
);
  assign id_13 = id_12;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_4,
      id_5,
      id_3,
      id_15,
      id_14,
      id_18,
      id_0,
      id_16,
      id_9,
      id_12,
      id_13,
      id_13,
      id_0,
      id_11,
      id_11,
      id_7,
      id_1
  );
  parameter id_22 = 1;
endmodule
