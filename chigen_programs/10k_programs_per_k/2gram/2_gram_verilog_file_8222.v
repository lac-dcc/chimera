// Seed: 2152505234
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output wand id_2,
    input wand id_3,
    input wand id_4,
    input tri1 id_5,
    input tri id_6,
    output tri0 id_7,
    input uwire id_8,
    output tri1 id_9,
    output tri1 id_10,
    input tri0 id_11,
    input wand id_12,
    output uwire id_13,
    output supply1 id_14,
    output wand id_15,
    output wor id_16,
    input supply0 id_17,
    input wire id_18,
    output tri1 id_19,
    input supply0 id_20,
    output wand id_21,
    input wor id_22
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri id_4,
    output tri1 id_5,
    input uwire id_6,
    output tri id_7,
    input tri0 id_8,
    input wand id_9,
    input wor id_10,
    output tri0 id_11,
    output tri id_12,
    output tri0 id_13,
    input tri0 id_14,
    output uwire id_15,
    inout wand id_16,
    input wand id_17
    , id_20,
    output supply1 id_18
);
  assign id_13 = id_10 | 1'b0;
  id_21 :
  assert property (@(id_6 or posedge id_8) 1 ? 1 : -1 ? -1 - -1 : -1 ? id_0 : -1)
  else;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_7,
      id_8,
      id_3,
      id_3,
      id_14,
      id_18,
      id_14,
      id_16,
      id_12,
      id_10,
      id_9,
      id_13,
      id_11,
      id_7,
      id_11,
      id_1,
      id_1,
      id_11,
      id_8,
      id_2,
      id_16
  );
  parameter id_22 = -1;
endmodule
