// Seed: 1917491268
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri id_3,
    input tri id_4,
    input tri1 id_5,
    input wand id_6,
    output tri1 id_7,
    output uwire id_8,
    input tri0 id_9,
    input wire id_10
);
  always_comb @(posedge -1'b0);
endmodule
module module_1 #(
    parameter id_0 = 32'd90
) (
    input wand _id_0,
    output supply1 id_1,
    input supply0 id_2,
    output wor id_3,
    output wire id_4
);
  logic [7:0] id_6;
  ;
  assign id_3 = id_6;
  logic id_7;
  buf primCall (id_4, id_2);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
  assign id_4 = id_6[id_0] - id_2;
endmodule
