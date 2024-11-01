// Seed: 4236848705
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input tri id_2,
    input wor void id_3,
    input uwire id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    input wand id_8,
    input supply1 id_9,
    input tri1 id_10,
    output uwire id_11,
    output wand id_12,
    input tri1 id_13,
    output wor id_14,
    input uwire id_15
);
  assign id_11 = id_15 & id_13 != 1;
  wire id_17, id_18, id_19, id_20;
  supply1 id_21, id_22;
  reg id_23;
  initial id_23 <= 1'h0;
  assign id_22 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2
);
  assign id_1 = id_2;
  reg id_4, id_5, id_6;
  always id_5 <= id_4;
  always id_4 <= 1;
  module_0(
      id_2, id_1, id_2, id_0, id_0, id_2, id_2, id_0, id_2, id_0, id_0, id_1, id_1, id_0, id_1, id_0
  ); id_7(
      1
  );
endmodule
