// Seed: 3694782850
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output reg id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_2,
      id_4
  );
  output wire id_1;
  always begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_2 #(
    parameter id_8 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
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
    id_24,
    id_25,
    id_26,
    id_27
);
  output wire id_27;
  input wire id_26;
  input wire id_25;
  input wire id_24;
  output wire id_23;
  inout wire id_22;
  module_0 modCall_1 (
      id_20,
      id_19
  );
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire _id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_28 = 1;
  assign id_3[1~^~id_8] = id_24;
endmodule
