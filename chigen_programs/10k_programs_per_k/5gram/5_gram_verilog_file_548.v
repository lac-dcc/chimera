// Seed: 2695715088
module module_0;
  always @(posedge -1) begin : LABEL_0
    if (1) disable id_1;
    else id_1 = 1'b0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  inout reg id_2;
  input wire id_1;
  always @(posedge -1 or posedge id_2) begin : LABEL_0
    if (1) id_2 <= 1;
  end
  wire id_4;
  ;
endmodule
module module_2 #(
    parameter id_12 = 32'd65,
    parameter id_15 = 32'd68,
    parameter id_17 = 32'd81,
    parameter id_21 = 32'd13,
    parameter id_26 = 32'd83
) (
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
    _id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    _id_21,
    id_22,
    id_23,
    id_24
);
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  input wire _id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  module_0 modCall_1 ();
  inout wire _id_17;
  output wire id_16;
  input wire _id_15;
  output wire id_14;
  output uwire id_13;
  output wire _id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  nor primCall (id_1, id_10, id_18, id_19, id_23, id_24, id_3, id_4, id_5, id_6, id_7, id_8, id_9);
  output wire id_1;
  parameter id_25 = 1 == 1 - 1'h0;
  wire _id_26;
  assign id_2[{id_15{id_21}}] = id_25 ? id_7 : 1'b0;
  assign id_13 = ({{1, {id_8, id_10, -1}}, 1}) <= -1;
  logic [(  id_17  ) : id_12] id_27;
  assign id_7[id_26] = -1 || 1;
  int  id_28;
  wire id_29;
endmodule
