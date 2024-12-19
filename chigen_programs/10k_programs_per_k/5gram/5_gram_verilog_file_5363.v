// Seed: 3306979188
module module_0 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2,
    output wand id_3,
    output wire id_4,
    output uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input uwire id_10,
    input wand id_11,
    output tri1 id_12,
    input tri1 id_13,
    input supply0 id_14,
    input uwire id_15
);
  wand id_17;
  assign module_1.id_6 = 0;
  always @(1 or posedge id_9) id_4 = id_15 == id_17;
  wire id_18;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    output uwire id_3,
    input wand id_4,
    input wand id_5,
    input wire id_6,
    input tri id_7,
    input wand id_8,
    input tri0 id_9,
    input wand id_10,
    input uwire id_11,
    input uwire id_12,
    output wor id_13,
    input tri id_14
);
  or primCall (id_13, id_8, id_6, id_1, id_5, id_4, id_14, id_10, id_11, id_9, id_16, id_7);
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_0,
      id_13,
      id_13,
      id_13,
      id_12,
      id_3,
      id_7,
      id_9,
      id_9,
      id_3,
      id_12,
      id_1,
      id_12
  );
endmodule
