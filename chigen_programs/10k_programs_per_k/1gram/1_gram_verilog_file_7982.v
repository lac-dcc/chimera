// Seed: 1115825552
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout tri id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_8;
  assign id_4 = -1;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd18
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
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  input wire _id_15;
  inout wire id_14;
  output logic [7:0] id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_17,
      id_18,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  always @(posedge 1'b0) id_13[-1 : 1][id_15] = -1;
  struct packed {
    logic id_22;
    logic id_23;
  } id_24;
  ;
  assign id_3 = id_24.id_23;
endmodule
