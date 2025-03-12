// Seed: 3483192131
module module_0 #(
    parameter id_5 = 32'd4
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [id_5 : -1] id_13;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd56,
    parameter id_4  = 32'd17,
    parameter id_6  = 32'd6,
    parameter id_8  = 32'd60
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire _id_10;
  output wire id_9;
  input wire _id_8;
  output logic [7:0] id_7;
  inout wire _id_6;
  output wire id_5;
  output wire _id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  struct {
    logic [{  -1  ,  -1 'b0 !=?  1  ,  (  -1  )  } : id_8] id_14;
    logic [-1 : id_6] id_15;
    logic id_16;
  } [id_10 : id_4] id_17;
  ;
  assign id_17.id_15 = 1'b0;
  always id_7[id_6] = -1'b0;
  logic id_18;
  id_19(
      1, -1
  );
  assign id_19[1+:id_8] = id_8;
  assign id_6 = id_17.id_15;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_15,
      id_3,
      id_6,
      id_3,
      id_15,
      id_14,
      id_17.id_15,
      id_17,
      id_9,
      id_16
  );
  logic id_20;
  ;
endmodule
