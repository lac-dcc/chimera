// Seed: 1019037787
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd97,
    parameter id_3  = 32'd27,
    parameter id_5  = 32'd26,
    parameter id_6  = 32'd69
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  output logic [7:0] id_14;
  output wire id_13;
  input wire _id_12;
  input wire id_11;
  output logic [7:0] id_10;
  output logic [7:0] id_9;
  input wire id_8;
  input wire id_7;
  inout wire _id_6;
  inout wire _id_5;
  inout wire id_4;
  input wire _id_3;
  inout wire id_2;
  output wire id_1;
  if (1) begin : LABEL_0
    assign id_1 = id_2;
    integer id_17;
    ;
  end else begin : LABEL_1
    assign id_9[{"", 1, id_12}==-1] = -1'b0;
    assign id_13 = id_5;
  end
  assign id_14[1 : id_5] = id_5;
  genvar id_18;
  parameter id_19 = 1;
  logic [id_5 : id_12] id_20;
  parameter id_21 = 1;
  id_22 :
  assert property (@(posedge 1) id_7)
  else @(*);
  wire id_23;
  logic [id_3 : 1] id_24;
  ;
  logic [id_6 : -1] id_25;
  assign id_10[1+:-1'b0] = id_2;
  parameter id_26 = id_19;
  module_0 modCall_1 (
      id_23,
      id_18,
      id_21
  );
endmodule
