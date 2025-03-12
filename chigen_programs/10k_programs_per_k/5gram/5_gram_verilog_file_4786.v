// Seed: 3404905367
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
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_15 = 1;
  initial begin : LABEL_0
    id_15 = id_15;
  end
endmodule
module module_1 #(
    parameter id_1  = 32'd88,
    parameter id_20 = 32'd97
) (
    _id_1,
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
    _id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  inout tri id_22;
  output wire id_21;
  input wire _id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_21,
      id_15,
      id_13,
      id_15,
      id_21,
      id_19,
      id_16,
      id_22,
      id_12,
      id_22,
      id_15,
      id_22,
      id_9,
      id_15
  );
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire _id_1;
  tri0 [1 : id_1  <  id_20] id_24 = {1'b0{1}};
  assign id_22 = -1 ~^ id_24 ? id_2 : 1;
  logic [-1 : 1] id_25;
  ;
endmodule
