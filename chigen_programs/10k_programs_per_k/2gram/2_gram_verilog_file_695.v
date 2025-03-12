// Seed: 1371651908
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0][1  ? 'b0 -  -1 : 1 : -1] id_25;
  assign id_23 = id_25[1!=-1];
  wire id_26;
endmodule
module module_1 #(
    parameter id_10 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_6,
      id_6,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_2,
      id_7
  );
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  ;
  wire _id_10;
  wire [id_10 : (  1  )] id_11;
  assign id_9 = id_10;
  assign id_6 = id_10;
  assign id_7 = ~id_11;
endmodule
