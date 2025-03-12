// Seed: 3549601297
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[1 :-1],
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_13;
endmodule
module module_1 #(
    parameter id_15 = 32'd41,
    parameter id_16 = 32'd69,
    parameter id_2  = 32'd26
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9[1&&id_2 : 1],
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    _id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_20,
      id_21,
      id_9,
      id_13,
      id_20,
      id_11,
      id_12,
      id_20,
      id_5,
      id_18
  );
  inout wire id_18;
  inout wire id_17;
  inout wire _id_16;
  inout wire _id_15;
  output wire id_14;
  inout uwire id_13;
  input wire id_12;
  inout tri0 id_11;
  xor primCall (
      id_18, id_5, id_12, id_13, id_10, id_8, id_11, id_7, id_17, id_21, id_1, id_6, id_20
  );
  inout wire id_10;
  output logic [7:0] id_9;
  input wire id_8;
  inout wire id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire _id_2;
  input wire id_1;
  wire id_22;
  assign id_13 = id_6[id_16+:(id_15)] == -1;
  wire id_23;
  ;
  assign id_11 = 1'b0;
endmodule
