// Seed: 701205899
module module_0 (
    input  tri  id_0,
    output tri1 id_1,
    input  wand id_2
);
  assign id_1 = -1;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd31,
    parameter id_4 = 32'd39,
    parameter id_6 = 32'd96,
    parameter id_8 = 32'd4
) (
    output wire id_0,
    output tri1 id_1,
    input wand id_2,
    input wor _id_3,
    input tri1 _id_4,
    input wire id_5,
    input tri1 _id_6,
    input supply0 id_7,
    inout tri0 _id_8
);
  logic [7:0][1 : id_4] id_10;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
  generate
    assign id_10[1|id_8] = (id_8);
  endgenerate
  wire [id_3 : id_6  ==  1] id_11;
  always_comb @(posedge id_4 or id_8) id_10[1^id_8] <= 1;
endmodule
