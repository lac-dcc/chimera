// Seed: 2765408573
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
    id_15
);
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  wire id_17;
  parameter id_18 = 1;
  parameter id_19 = id_18[-1] - 1 & (id_18);
  logic [(  -1  ) : -1] id_20 = id_16, id_21, id_22;
  assign id_22 = id_9;
  initial $unsigned(96);
  ;
  wire id_23 = id_3;
  specify
    specparam id_24 = id_17;
  endspecify
endmodule
module module_1 #(
    parameter id_2 = 32'd50
) (
    id_1,
    _id_2,
    id_3
);
  output tri id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1
  );
  input wire _id_2;
  inout wire id_1;
  assign id_3 = $signed(30);
  ;
  assign id_3 = {1} == id_2;
  logic [1 : id_2] id_4;
  ;
  static logic id_5;
endmodule
