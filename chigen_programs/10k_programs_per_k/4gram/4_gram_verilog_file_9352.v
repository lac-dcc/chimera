// Seed: 1537882167
module module_0 #(
    parameter id_3 = 32'd18,
    parameter id_4 = 32'd28
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  input wire _id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0]
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
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42,
      id_43,
      id_44,
      id_45,
      id_46,
      id_47,
      id_48;
  assign id_28 = id_34;
  assign id_25[id_3] = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd9,
    parameter id_12 = 32'd27
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout tri1 id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire _id_1;
  parameter id_12 = 1 == !1;
  id_13 :
  assert property (@(posedge id_4) id_13[id_12])
  else $unsigned(id_12);
  ;
  logic id_14;
  ;
  generate
    assign id_10 = -1;
  endgenerate
  assign id_2[id_1] = id_12;
  wire id_15;
  wire id_16, id_17;
  wire id_18;
  xnor primCall (id_5, id_18, id_10, id_15, id_11, id_6, id_13, id_17, id_16, id_14, id_4);
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_18,
      id_12,
      id_12,
      id_13,
      id_15,
      id_4,
      id_5,
      id_6,
      id_19
  );
endmodule
