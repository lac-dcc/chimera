// Seed: 1828301269
module module_0 #(
    parameter id_11 = 32'd32
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19[-1 :-1],
    id_20,
    id_21
);
  input wire id_21;
  inout wire id_20;
  inout logic [7:0] id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire _id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout supply1 id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always if (-1'b0) $signed(59);
  ;
  wire id_22[id_11 : -1];
  bit id_23, id_24;
  always id_23 <= id_20;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd89,
    parameter id_1 = 32'd40
) (
    input  uwire   _id_0,
    output supply0 _id_1
);
  localparam int id_3 = 1;
  assign id_1 = id_3[1'h0];
  union packed {
    logic id_4;
    logic id_5;
    logic id_6;
    id_7 id_8 = -1;
    logic id_9[id_1 : id_0];
    logic id_10;
    logic id_11[id_0 : -1  ==?  -1 'd0];
  } id_12;
  ;
  logic id_13;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_12,
      id_8,
      id_1,
      id_10,
      id_5,
      id_7,
      id_11,
      id_5,
      id_5,
      id_8,
      id_3,
      id_11,
      id_13
  );
  wire id_14, id_15, id_16;
  assign id_12.id_4 = id_12.id_8 === -1;
endmodule
