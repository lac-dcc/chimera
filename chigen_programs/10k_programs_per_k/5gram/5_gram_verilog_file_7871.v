// Seed: 3620217456
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout uwire id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
  output reg id_2;
  inout reg id_1;
  final begin : LABEL_0
    id_1 = id_3;
    id_2 = id_1;
  end
  wire id_4;
  assign id_2 = id_1 == id_3;
endmodule
module module_0 #(
    parameter id_14 = 32'd30,
    parameter id_17 = 32'd86
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
    _id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    module_2,
    id_23,
    id_24
);
  output wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  module_0 modCall_1 (
      id_1,
      id_15,
      id_7,
      id_5
  );
  input wire id_20;
  input wire id_19;
  output wire id_18;
  input wire _id_17;
  inout wire id_16;
  inout wire id_15;
  input wire _id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output reg id_9;
  output wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_1 or id_6[(id_17)]) begin : LABEL_0
    id_9 <= id_11;
  end
  wire [~  id_14 : -1] id_25;
endmodule
