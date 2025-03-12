// Seed: 2194387549
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    output supply1 id_4,
    output wire id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wire id_8,
    output tri0 id_9,
    output wor id_10,
    input wire id_11,
    output uwire id_12,
    input wire id_13,
    input wire id_14,
    output supply1 id_15,
    output wire id_16,
    output wand id_17,
    input supply0 id_18,
    output uwire id_19
);
  always @(-1 or posedge 1'b0) begin : LABEL_0
    $unsigned(41);
    ;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri id_3,
    output supply0 id_4,
    input tri id_5,
    input wand id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wand id_9
);
  assign id_4 = -1 ? -1'b0 : 1;
  nand primCall (id_2, id_8, id_3, id_1, id_6, id_5, id_0);
  module_0 modCall_1 (
      id_7,
      id_2,
      id_4,
      id_1,
      id_9,
      id_9,
      id_7,
      id_1,
      id_2,
      id_9,
      id_4,
      id_3,
      id_2,
      id_1,
      id_5,
      id_4,
      id_4,
      id_4,
      id_8,
      id_2
  );
  assign modCall_1.id_18 = 0;
endmodule
