// Seed: 1311910103
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd13,
    parameter id_20 = 32'd57,
    parameter id_23 = 32'd24,
    parameter id_25 = 32'd95,
    parameter id_29 = 32'd82
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
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20
);
  inout wire _id_20;
  inout logic [7:0] id_19;
  output logic [7:0] id_18;
  output wire id_17;
  output logic [7:0] id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire _id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [ id_12 : 1] id_21;
  logic [-1 : id_20] id_22;
  ;
  assign id_19 = id_21;
  wire _id_23;
  ;
  assign id_17 = 1;
  logic id_24;
  ;
  logic _id_25 = -1;
  assign id_19[-1] = 1 == id_13;
  parameter id_26 = 1;
  wire [1 'b0 : 1] id_27, id_28, _id_29;
  assign id_16[id_25] = id_26 == -1'd0 & id_6;
  wire id_30;
  ;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_30,
      id_8
  );
  wire id_31;
  always id_21 = #id_32 id_13;
  always @* id_18[-1*-1<<id_29] <= {-1, id_26};
  assign id_10 = id_22;
endmodule
