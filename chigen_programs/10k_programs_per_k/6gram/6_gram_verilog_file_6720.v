// Seed: 3141117510
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output wor   id_3,
    input  tri0  id_4,
    input  wand  id_5,
    output tri   id_6,
    input  uwire id_7,
    output tri   id_8,
    input  tri1  id_9,
    input  uwire id_10,
    output tri0  id_11,
    output tri   id_12
);
  wire id_14;
  ;
  assign id_8  = id_2;
  assign id_12 = 1;
  always @(id_4 or posedge 1) begin : LABEL_0
    deassign id_12;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd25,
    parameter id_2 = 32'd95
) (
    input supply1 _id_0,
    output tri id_1,
    input wire _id_2,
    input supply0 id_3
);
  wire id_5;
  ;
  assign id_1 = -1;
  logic [id_0 : id_2] id_6;
  ;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
