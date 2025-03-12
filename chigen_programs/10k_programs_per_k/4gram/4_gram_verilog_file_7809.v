// Seed: 2516611282
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout supply1 id_6;
  inout uwire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = 1;
  assign id_2 = -1;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_26 = 32'd75,
    parameter id_37 = 32'd65,
    parameter id_4  = 32'd86,
    parameter id_5  = 32'd30
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  input wire id_6;
  output wire _id_5;
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8;
  ;
  reg
      id_9,
      \id_10 ,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      _id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31;
  wire id_32;
  logic [-1 : id_5] id_33;
  ;
  logic id_34 = \id_10 ;
  wire id_35;
  wire [-1 : id_26] id_36;
  parameter id_37 = 1;
  assign id_9 = id_32;
  genvar id_38;
  module_0 modCall_1 (
      id_35,
      id_3,
      id_38,
      id_34,
      id_34,
      id_33,
      id_1
  );
  logic id_39[-1 : 1];
  always_comb @(*) begin : LABEL_0
    id_16 <= id_36 * id_20 + {1{id_35}};
  end
  wire id_40;
  id_41 :
  assert property (@(negedge -1) 1)
  else $clog2(id_37);
  ;
  assign id_36 = id_6;
  generate
    defparam id_37.id_37 = id_37;
  endgenerate
endmodule
