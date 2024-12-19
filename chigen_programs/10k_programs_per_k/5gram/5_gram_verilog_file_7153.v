// Seed: 1149270229
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
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
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always_latch @(posedge id_8 or negedge "") begin : LABEL_0
    disable id_22;
  end
  wire id_23 = 1;
  module_0 modCall_1 (
      id_21,
      id_23,
      id_12,
      id_21
  );
  wire id_24;
  assign id_3 = id_11 == 1;
  wire id_25;
  always @(posedge id_1) id_9 = 1;
  initial assume (1 & id_7) $display(1);
endmodule
