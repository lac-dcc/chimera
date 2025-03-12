// Seed: 3769655710
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    input tri id_3,
    input tri1 id_4,
    output tri0 id_5,
    output wor id_6,
    input supply1 id_7,
    output supply1 id_8,
    input wor id_9,
    output wire id_10,
    input wor id_11,
    input wand id_12,
    input supply1 id_13,
    output tri0 id_14
);
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input supply1 id_2,
    input uwire id_3,
    output tri1 id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input supply0 id_8,
    output wor id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri1 id_12,
    input uwire id_13,
    output wand id_14,
    output wire id_15
);
  always @((id_13) or posedge id_1) begin : LABEL_0
    if (-1'b0) assume (id_8);
  end
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_1,
      id_4,
      id_14,
      id_12,
      id_14,
      id_11,
      id_15,
      id_8,
      id_6,
      id_10,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
