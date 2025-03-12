// Seed: 3719761994
module module_0;
  initial begin : LABEL_0
    `define pp_1 0
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd94,
    parameter id_15 = 32'd99,
    parameter id_16 = 32'd34,
    parameter id_20 = 32'd46,
    parameter id_4  = 32'd8,
    parameter id_6  = 32'd53,
    parameter id_7  = 32'd62,
    parameter id_8  = 32'd3,
    parameter id_9  = 32'd86
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    _id_7,
    _id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    _id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire _id_16;
  inout wire _id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire _id_10;
  module_0 modCall_1 ();
  inout wire _id_9;
  input wire _id_8;
  inout wire _id_7;
  inout wire _id_6;
  inout wire id_5;
  inout wire _id_4;
  nor primCall (id_1, id_11, id_12, id_17, id_19, id_3, id_5);
  input wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  wire _id_20 = id_1[-1 : {
    id_8, id_6, id_7, id_16, id_20, id_10, id_6, id_4, id_9, 1'h0, -1'b0^id_15
  }];
endmodule
