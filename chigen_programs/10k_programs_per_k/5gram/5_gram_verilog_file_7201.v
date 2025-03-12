// Seed: 386752589
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
    id_17
);
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wand id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_18;
  assign id_9 = 1;
  wire id_19, id_20, id_21;
  wire id_22;
endmodule
module module_1 #(
    parameter id_2 = 32'd10,
    parameter id_5 = 32'd18
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  output logic [7:0] id_4;
  output wire id_3;
  input wire _id_2;
  output wire id_1;
  wire ["" : (  -1  )] id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_1,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign id_4[-1 : id_2&-1'h0*1-id_5] = id_6 < id_2;
endmodule
