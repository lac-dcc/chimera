// Seed: 1046348921
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7 = 1;
  assign id_6 = id_6;
  assign id_1 = id_9 << id_7;
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
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_24;
  assign id_18 = ~id_15;
  assign id_12 = id_18;
  module_0 modCall_1 (
      id_20,
      id_4,
      id_14,
      id_20,
      id_15,
      id_1,
      id_15,
      id_24,
      id_22
  );
  assign modCall_1.id_7 = 0;
  wire id_25;
  always @* begin : LABEL_0
    if (1) begin : LABEL_0
      id_16 <= 1'b0 - (~id_7);
    end
  end
endmodule
