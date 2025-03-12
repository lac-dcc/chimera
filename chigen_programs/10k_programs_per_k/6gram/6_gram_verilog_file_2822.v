// Seed: 2085474921
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
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  wand id_18, id_19 = -1;
  assign id_1[-1] = -1'd0;
  localparam id_20 = 1;
  assign id_3 = id_18;
  tri0 id_21;
  assign id_21 = 1;
  wire id_22;
  ;
endmodule
module module_1 #(
    parameter id_8 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  parameter id_7 = 1;
  wire _id_8;
  assign id_2[-1==1] = ~id_5[id_8 : 1] ? -1 : id_4;
  wire id_9;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_6,
      id_1,
      id_7,
      id_7,
      id_9,
      id_7,
      id_4,
      id_7,
      id_3,
      id_9,
      id_6,
      id_9,
      id_3,
      id_9,
      id_1
  );
  wire id_10;
  ;
endmodule
