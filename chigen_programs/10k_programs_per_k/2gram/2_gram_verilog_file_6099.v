// Seed: 3501158860
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_15 :
  assert property (@(id_8 or posedge 1) 1)
  else id_15 <= id_11;
endmodule
module module_1 #(
    parameter id_27 = 32'd52,
    parameter id_35 = 32'd42,
    parameter id_37 = 32'd9,
    parameter id_9  = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14#(
        .id_15(id_16),
        .id_17(-1),
        .id_18(1'b0),
        .id_19(-1),
        .id_20(id_21),
        .id_22(1),
        .id_23(id_24)
    ),
    id_25,
    id_26,
    _id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34
);
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire _id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_25,
      id_30,
      id_23,
      id_15,
      id_28,
      id_33,
      id_5,
      id_26,
      id_33,
      id_34,
      id_14,
      id_30,
      id_4
  );
  assign modCall_1.id_15 = 0;
  output wire id_1;
  wire _id_35;
  logic [7:0] id_36;
  ;
  logic [-1  ==  id_35  (  id_9  ) : -1] _id_37 = id_15;
  logic id_38[{  id_37  ,  -1  } : -1];
  ;
  assign id_22 = id_36[id_27 : 1&-1];
endmodule
