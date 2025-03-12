// Seed: 2099596266
module module_0 #(
    parameter id_2 = 32'd40,
    parameter id_7 = 32'd26
) (
    input  tri   id_0,
    output wand  id_1,
    input  uwire _id_2,
    output uwire id_3
);
  localparam id_5 = 1;
  wire id_6;
  wire _id_7;
  wire [-1 'b0 ==?  -1 : id_7  -  id_2] id_8;
  parameter id_9 = 1;
  id_10 :
  assert property (@(posedge id_7) 'b0)
  else $clog2(27);
  ;
  wire id_11;
  generate
    genvar id_12;
  endgenerate
  assign module_1._id_11 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd99
) (
    output tri1  id_0,
    input  uwire id_1,
    output uwire id_2,
    input  tri   id_3,
    output logic id_4,
    output wor   id_5,
    input  tri0  id_6
    , _id_11,
    input  uwire id_7
    , id_12,
    input  uwire id_8,
    input  wire  id_9
);
  wire [-1  ^  1 : id_11] id_13;
  assign id_4 = id_6;
  initial begin : LABEL_0
    id_4 <= -1;
  end
  assign id_11 = id_9;
  assign id_12 = -1;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_11,
      id_5
  );
endmodule
