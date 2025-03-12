// Seed: 3160725881
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
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1  = 32'd58,
    parameter id_10 = 32'd69,
    parameter id_16 = 32'd67,
    parameter id_2  = 32'd93,
    parameter id_6  = 32'd56,
    parameter id_9  = 32'd11
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9
);
  output wire _id_9;
  input wire id_8;
  inout wire id_7;
  output wire _id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_8,
      id_7,
      id_7,
      id_7,
      id_3,
      id_3,
      id_7,
      id_8,
      id_5,
      id_4,
      id_7,
      id_3,
      id_7,
      id_8,
      id_7,
      id_7
  );
  input wire _id_2;
  input wire _id_1;
  localparam id_10 = 1;
  wire [id_2 : id_2] id_11;
  logic [id_9 : (  1  )] id_12[id_6 : id_1];
  wire id_13;
  struct packed {id_14 id_15;} [id_10 : 1 'b0] _id_16 = id_13, id_17;
  wire id_18;
  assign id_7 = id_16;
  wire id_19;
  ;
  wire [1 : id_16] id_20;
  assign id_17[id_1] = id_20;
  always @(negedge -1 or id_8) begin : LABEL_0
    deassign id_16.id_14;
  end
endmodule
