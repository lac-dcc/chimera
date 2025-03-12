// Seed: 3520973078
module module_0 (
    input  tri1  id_0,
    input  wire  id_1,
    input  wand  module_0,
    input  tri0  id_3,
    input  wire  id_4,
    output tri   id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  tri   id_8,
    input  tri   id_9,
    output wire  id_10,
    output uwire id_11
);
  assign id_5 = id_8;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_21 = 32'd53
) (
    input  tri   id_0,
    output uwire id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wire  id_6,
    input  tri0  id_7,
    output tri   id_8,
    input  tri0  id_9,
    output wand  id_10,
    input  tri0  id_11,
    input  tri1  id_12,
    input  wand  id_13,
    output tri0  id_14,
    inout  tri1  id_15,
    output tri0  id_16,
    input  uwire id_17,
    input  wire  id_18,
    output uwire id_19,
    input  uwire id_20,
    input  wor   _id_21,
    output tri0  id_22,
    output wor   id_23,
    output uwire id_24
);
  assign id_10 = id_18 - "";
  always @(posedge id_9 or posedge -1) begin : LABEL_0
    $unsigned(83);
    ;
  end
  wire [id_21 : -1 'b0] id_26;
  module_0 modCall_1 (
      id_20,
      id_9,
      id_3,
      id_9,
      id_2,
      id_23,
      id_2,
      id_17,
      id_4,
      id_9,
      id_6,
      id_24
  );
  always @(posedge id_17 or negedge id_11) release id_1;
endmodule
