// Seed: 3843367346
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output wor id_2,
    input tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    input wand id_6,
    input wand id_7,
    input supply1 id_8,
    output supply0 id_9,
    output tri1 id_10,
    input uwire id_11,
    output wire id_12,
    input wand id_13,
    output supply1 id_14,
    output wand id_15,
    input tri id_16,
    output uwire id_17,
    input wor id_18,
    input tri0 id_19,
    output uwire id_20,
    input wor id_21,
    output uwire id_22
);
  generate
    id_24 :
    assert property (@(negedge -1 + 1) id_0)
    else;
  endgenerate
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    output wand id_3,
    output wire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_3,
      id_4,
      id_1,
      id_2,
      id_1,
      id_3,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_3,
      id_0,
      id_3
  );
endmodule
