// Seed: 4248262720
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd94,
    parameter id_5 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire _id_5;
  nand primCall (id_1, id_7, id_8, id_6, id_10, id_2, id_9);
  output wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wand id_1;
  always @(id_1) begin : LABEL_0
    $clog2(46);
    ;
  end
  assign id_2[1] = 1;
  parameter id_8 = 1;
  logic [id_4 : id_5] id_9;
  assign id_1 = id_5 + id_1;
  specify
    specparam id_10 = 1'd0, id_11 = 1;
  endspecify
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_9,
      id_6,
      id_6,
      id_7,
      id_10,
      id_1,
      id_11
  );
endmodule
