// Seed: 3631279313
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
    id_27,
    id_28
);
  input wire id_28;
  output wire id_27;
  input wire id_26;
  inout wire id_25;
  input wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_29;
  assign module_1.id_7 = 0;
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_5 ^ id_4;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_1,
      id_2,
      id_4,
      id_4,
      id_5,
      id_1,
      id_5,
      id_3,
      id_4,
      id_4,
      id_5,
      id_1,
      id_6,
      id_6,
      id_1,
      id_2,
      id_5
  );
  reg id_7, id_8, id_9, id_10;
  always_comb @(posedge id_4) begin : LABEL_0
    id_9 <= id_10;
  end
endprogram
