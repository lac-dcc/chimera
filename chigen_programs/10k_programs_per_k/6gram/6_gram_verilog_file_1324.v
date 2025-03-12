// Seed: 3903588806
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
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4[-1] = id_7;
endmodule
module module_1 #(
    parameter id_12 = 32'd13,
    parameter id_16 = 32'd61,
    parameter id_22 = 32'd54,
    parameter id_24 = 32'd26,
    parameter id_31 = 32'd59
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
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    _id_22,
    id_23,
    _id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    _id_31,
    id_32
);
  output wire id_32;
  input wire _id_31;
  input wire id_30;
  input wire id_29;
  inout logic [7:0] id_28;
  inout wire id_27;
  inout logic [7:0] id_26;
  input wire id_25;
  input wire _id_24;
  output logic [7:0] id_23;
  inout wire _id_22;
  inout reg id_21;
  inout wire id_20;
  output logic [7:0] id_19;
  output wire id_18;
  inout logic [7:0] id_17;
  input wire _id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire _id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire  [-1 : id_12] id_33;
  logic [-1 : id_31] id_34;
  wire id_35, id_36;
  wire id_37;
  assign id_17[-1] = id_31 ? 1 : -1;
  assign id_34 = 1;
  parameter id_38 = 1 === 1;
  always @(posedge -1'b0 == 1) begin : LABEL_0
    id_19[1] = id_28;
  end
  module_0 modCall_1 (
      id_4,
      id_27,
      id_29,
      id_5,
      id_9,
      id_27,
      id_6,
      id_30,
      id_4,
      id_13,
      id_37,
      id_34,
      id_32,
      id_13,
      id_33
  );
  assign id_26[id_16] = 1;
  assign id_23[id_22] = 1 - id_5[id_24/id_24] ? id_25 : 'b0;
  wire id_39;
  always @(id_28[1] or posedge id_10) if (id_38) id_21 <= id_16;
endmodule
