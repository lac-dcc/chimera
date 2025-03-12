// Seed: 1297705556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9#(.id_10(-1 || -1)),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16[1 : 1];
  assign id_16 = id_3;
endmodule
module module_1 #(
    parameter id_12 = 32'd39
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  input wire _id_12;
  output wire id_11;
  inout wire id_10;
  output logic [7:0] id_9;
  output wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_10,
      id_3,
      id_10,
      id_14,
      id_11,
      id_14,
      id_6,
      id_3,
      id_10,
      id_10,
      id_6,
      id_6
  );
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    #1 begin : LABEL_1
      return ~1;
    end
  end
  always id_9[id_12] <= (1);
  wire id_15 = id_4;
  wire id_16;
  ;
  logic [-1 : 1  ^  1 'b0] id_17;
endmodule
