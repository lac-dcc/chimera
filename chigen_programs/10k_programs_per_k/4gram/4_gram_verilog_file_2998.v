// Seed: 3927557024
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input wire id_2,
    input wor id_3,
    input wor id_4,
    output wire id_5,
    output supply0 id_6,
    input wor id_7,
    output wor id_8
);
  assign id_0 = 1'd0;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    output wand id_6,
    output tri id_7,
    input wand id_8,
    input supply1 id_9,
    output wand id_10,
    input wire id_11
);
  always_comb @(negedge id_1) $display;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_8,
      id_5,
      id_1,
      id_7,
      id_4,
      id_9,
      id_6
  );
  assign modCall_1.id_4 = 0;
  generate
    always @("") begin : LABEL_0
      id_4 = 1;
    end
  endgenerate
endmodule
