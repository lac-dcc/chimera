// Seed: 2690811632
module module_0 (
    id_1
);
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  reg id_3;
  always @(id_2) if (id_1) id_1 = -1'b0;
  wire id_4;
  assign id_3 = 1;
  always_ff begin : LABEL_0
    id_3 <= id_1;
  end
  module_0 modCall_1 (id_4);
  assign modCall_1.id_1 = 0;
  reg id_5, id_6 = id_1;
endmodule
program module_2 (
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
    id_18
);
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (id_16);
  always id_5 = $realtime;
  wire id_19;
endmodule
