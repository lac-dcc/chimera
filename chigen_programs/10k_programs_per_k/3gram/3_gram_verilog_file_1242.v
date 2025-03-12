// Seed: 859332625
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
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  wire id_15;
  assign id_3[-1+:1] = -1;
endmodule
module module_1 #(
    parameter id_16 = 32'd13,
    parameter id_7  = 32'd38
) (
    id_1,
    id_2,
    id_3,
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
    _id_16,
    id_17
);
  input wire id_17;
  inout wire _id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout logic [7:0] id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire _id_7;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_12,
      id_14,
      id_9,
      id_17,
      id_6,
      id_15,
      id_10,
      id_13,
      id_9,
      id_15,
      id_6,
      id_15
  );
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12[id_16] = id_16;
  wire id_18;
  wire id_19 [id_7  ==  -1 'b0 &  -1 : 1];
  ;
  id_20(
      id_15, 1, id_20, id_18
  );
  or primCall (id_5, id_15, id_1, id_12, id_9, id_14, id_17);
  integer id_21;
  localparam id_22 = 1;
endmodule
