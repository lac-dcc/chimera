// Seed: 4049896556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8, id_9;
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
    id_23,
    id_24,
    id_25
);
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1[1] = id_10;
  assign id_6 = id_18 ? 1 : 1;
  always @(posedge id_3) begin : LABEL_0
    if (id_17 ^ id_23 & id_24[1]) begin : LABEL_0
      assume (1);
    end else id_12 <= 1;
  end
  always disable id_26;
  module_0 modCall_1 (
      id_20,
      id_6,
      id_4,
      id_17,
      id_10,
      id_10,
      id_21
  );
endmodule
