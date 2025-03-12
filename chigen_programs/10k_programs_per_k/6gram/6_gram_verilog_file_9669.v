// Seed: 2866528002
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri id_4
);
  generate
    for (id_6 = -1'b0; 1; id_6 = id_0) begin : LABEL_0
      initial id_6 = id_6;
      always @(id_2) begin : LABEL_1
        assume (1);
      end
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_0 = 32'd87
) (
    input  tri1  _id_0,
    input  wand  id_1,
    input  wand  id_2,
    output uwire id_3
);
  assign id_3 = -1;
  struct packed {
    id_5 id_6;
    logic [-1 : id_0] id_7;
  } id_8;
  logic id_9;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
