// Seed: 2791972255
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  wire id_10;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd77,
    parameter id_3 = 32'd37,
    parameter id_7 = 32'd96
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  input wire _id_7;
  output wire id_6;
  output uwire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_16,
      id_11,
      id_4,
      id_6,
      id_4,
      id_4,
      id_17,
      id_4,
      id_17
  );
  inout wire _id_3;
  input wire _id_2;
  input wire id_1;
  assign (highz1, weak0) id_5 = -1;
  wire [-1 'd0 : id_7] id_18;
  generate
    assign id_8[id_2~^id_3==-1'b0] = 1'b0;
  endgenerate
endmodule
