// Seed: 1293336045
module module_0 #(
    parameter id_1  = 32'd29,
    parameter id_10 = 32'd0,
    parameter id_14 = 32'd59,
    parameter id_17 = 32'd18,
    parameter id_8  = 32'd38
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  inout wire _id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire _id_10;
  output wire id_9;
  inout wire _id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire _id_1;
  wire [-1 'b0 : 1] _id_17;
  wire id_18;
  logic [-1 : 1] id_19;
  ;
  logic [id_1 : -1] id_20;
  ;
  logic [1  ==  id_17 : id_10] id_21[id_8 : id_14] = 1;
  integer id_22;
  ;
  assign id_19 = id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output tri1 id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1 or negedge -1) begin : LABEL_0
    $unsigned(87);
    ;
  end
  assign #id_9 id_7 = 1'b0;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_2,
      id_1,
      id_5,
      id_4,
      id_1,
      id_9,
      id_4,
      id_9,
      id_5,
      id_1,
      id_8,
      id_9,
      id_2,
      id_1
  );
  assign modCall_1.id_17 = 0;
  logic id_10;
  ;
  xnor primCall (id_1, id_2, id_6, id_5, id_9);
endmodule
