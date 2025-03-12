// Seed: 1364654922
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input wor id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wor id_5
);
  wire [1 'b0 : -1 'h0] id_7;
  reg id_8;
  assign id_5 = 1;
  assign id_1 = id_4;
  assign id_5 = 1;
  always @(id_2) begin : LABEL_0
    id_8 <= 1;
  end
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd97,
    parameter id_3 = 32'd2
) (
    input  wand  id_0,
    input  wire  _id_1,
    output tri0  id_2,
    output wand  _id_3,
    input  tri0  id_4,
    input  uwire id_5,
    input  tri   id_6,
    input  wor   id_7
);
  logic [-1 : -1 'h0 *  id_3  -  id_1] id_9;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_7,
      id_2,
      id_7,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
