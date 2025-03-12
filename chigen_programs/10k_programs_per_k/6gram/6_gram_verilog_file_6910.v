// Seed: 3510917880
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  supply0 id_7 = -1;
  assign id_5 = id_2 ? id_1 : -1;
  parameter id_8 = 1;
  uwire id_9 = 1;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd41,
    parameter id_5 = 32'd42
) (
    output uwire id_0,
    input  tri1  _id_1,
    input  uwire id_2,
    output tri   id_3,
    output tri   id_4,
    input  uwire _id_5,
    input  tri0  id_6
);
  parameter id_8 = -1'b0;
  assign id_0 = id_8;
  logic [id_1 : -1 'd0] id_9[id_5 : -1];
  and primCall (id_0, id_2, id_8, id_9, id_6);
  always @(1) begin : LABEL_0
    assume (1'b0);
  end
  assign id_4 = -1'b0;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
