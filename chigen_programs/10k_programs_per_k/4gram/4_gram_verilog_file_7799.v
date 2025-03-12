// Seed: 326603748
module module_0 #(
    parameter id_9 = 32'd19
) (
    input  tri1  id_0,
    output tri0  id_1,
    input  wire  id_2,
    input  wire  id_3,
    input  wand  id_4,
    output tri0  id_5
    , id_12,
    output uwire id_6,
    input  tri0  id_7,
    output tri1  id_8,
    input  tri   _id_9,
    input  tri0  id_10
);
  assign #(id_0) id_1 = id_7;
  logic [-1 : id_9] id_13;
  ;
  assign id_8 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd58,
    parameter id_3 = 32'd69
) (
    output wand id_0,
    input supply0 id_1,
    input wand _id_2
    , id_7,
    input wor _id_3,
    output tri id_4,
    output tri1 id_5
);
  wire id_8;
  wire [1 'd0 : 1 'b0 &&  -1] id_9;
  wire [id_2 : -1] id_10;
  wire [1 : 1  -  -1 'b0] id_11;
  assign id_8#(
      .id_11(1),
      .id_3 (1),
      .id_1 (1),
      .id_2 (1'b0),
      .id_9 (-1),
      .id_2 (1),
      .id_8 (1)
  ) = id_8;
  final begin : LABEL_0
    wait (1);
  end
  nand primCall (id_4, id_13, id_8, id_1, id_11, id_14, id_2, id_9, id_7, id_3);
  assign id_5 = -1;
  wire id_12;
  specify
    (negedge id_13 => (id_14 +: -1)) = (id_3 | -1, id_7[-1 : id_3]);
  endspecify
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
