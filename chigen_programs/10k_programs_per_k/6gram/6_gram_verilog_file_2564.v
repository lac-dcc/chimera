// Seed: 2409722434
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output wire id_2,
    input supply1 id_3,
    output supply0 id_4
    , id_14,
    input supply1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input wor id_8,
    output wand id_9,
    input supply0 id_10
    , id_15,
    input wand id_11
    , id_16,
    output tri id_12
);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    input tri0 id_2,
    output wor id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wand id_6
);
  reg id_8;
  and primCall (id_5, id_1, id_2, id_4, id_8);
  always @(negedge 1'b0) begin : LABEL_0
    id_8 <= 1'b0;
  end
  module_0 modCall_1 (
      id_6,
      id_2,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_6,
      id_4,
      id_3,
      id_4,
      id_4,
      id_5
  );
endmodule
