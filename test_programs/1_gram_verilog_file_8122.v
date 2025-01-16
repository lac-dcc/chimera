// Seed: 4079810713
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input tri0 id_2,
    output wand id_3,
    output tri id_4,
    input uwire id_5,
    output tri0 id_6,
    input tri0 id_7,
    input uwire id_8#((1)),
    input tri1 id_9,
    output supply0 id_10,
    input wire id_11
);
  id_13(
      id_11
  );
  wand id_14, id_15;
  assign id_10 = -1;
  supply0 id_16 = id_9;
  supply1 id_17 = 1;
  wire id_18, id_19;
  parameter id_20 = id_14;
endmodule
program module_1 (
    output tri id_0,
    output wand id_1,
    output tri1 id_2,
    output supply1 id_3,
    output tri1 id_4,
    output wire id_5,
    output wire id_6,
    input supply1 id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    input wire id_12,
    output tri0 id_13,
    output supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input tri id_17,
    input tri id_18
);
  id_20(
      1'd0, id_12, {id_20{-1}}, id_17, 1'd0, -1 << id_15, id_9, id_20
  );
  supply0 id_21 = 1 && {id_11, 1 & -1'h0};
  module_0 modCall_1 (
      id_18,
      id_13,
      id_7,
      id_5,
      id_3,
      id_18,
      id_14,
      id_18,
      id_15,
      id_16,
      id_14,
      id_12
  );
  assign modCall_1.id_1 = 0;
  assign id_20 = id_11;
endmodule
