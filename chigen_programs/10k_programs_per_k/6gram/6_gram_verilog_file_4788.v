// Seed: 1828470813
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_13 = 32'd4,
    parameter id_5  = 32'd87
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14
);
  inout wire id_14;
  inout wire _id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire _id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_11,
      id_1,
      id_8,
      id_8,
      id_6,
      id_4
  );
  wire id_15;
  always @(id_15) begin : LABEL_0
    $signed(73);
    ;
    deassign id_6;
  end
  logic [id_13 : -1] id_16 = id_6;
  always disable id_17;
  assign id_16 = id_8;
  specify
    (id_18 => id_19) = (-1, id_3[id_5 : 1] : id_10  : -1);
    specparam  id_20  =  id_1  ,  id_21  =  1  ,  id_22  =  id_7  ,  id_23  =  1  ,  id_24  =  id_20  ,  id_25  =  id_8  ,  id_26  =  -1  ;
    specparam id_27 = 1;
  endspecify
  xnor primCall (id_12, id_7, id_3, id_14, id_8, id_6, id_2, id_10, id_1);
endmodule
