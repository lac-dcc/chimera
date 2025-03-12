// Seed: 1406885122
module module_0 #(
    parameter id_3 = 32'd52
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[~id_3] = id_4;
  wand id_6 = 1;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_17 = 32'd48
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output logic [7:0] id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam id_17 = 1;
  assign id_9[1] = id_17;
  wire id_18;
  assign id_13 = id_8;
  module_0 modCall_1 (
      id_9,
      id_12,
      id_17,
      id_4,
      id_8
  );
  defparam id_17.id_17 = id_17;
endmodule
