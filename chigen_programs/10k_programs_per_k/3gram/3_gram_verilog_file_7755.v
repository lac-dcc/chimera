// Seed: 1362849546
module module_0 (
    input tri0  id_0,
    input wand  id_1,
    input uwire id_2
);
endmodule
module module_1 #(
    parameter id_3 = 32'd13,
    parameter id_4 = 32'd57,
    parameter id_5 = 32'd94,
    parameter id_8 = 32'd81
) (
    input tri1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input uwire _id_3,
    output uwire _id_4,
    input uwire _id_5
);
  integer [1  +  (  id_5  ) : 1] id_7;
  logic [-1  -  -1 : id_4] _id_8;
  logic id_9 = 1;
  assign id_7[-1'b0] = id_5;
  bit  id_10;
  wire id_11;
  assign id_9 = id_8;
  always @(~1'd0, 1'h0) begin : LABEL_0
    if (1) begin : LABEL_1
      id_10 = 1;
    end
  end
  localparam [id_5  -  id_3 : id_8] id_12 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
  wire id_13;
  parameter integer id_14 = ~id_12;
endmodule
