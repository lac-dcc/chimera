// Seed: 1195622531
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
    id_28,
    id_29,
    id_30
);
  inout wire id_30;
  input wire id_29;
  input wire id_28;
  output wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(negedge -1) begin : LABEL_0
    $unsigned(98);
    ;
    SystemTFIdentifier(id_10.id_6, -1, id_20, 1'b0);
  end
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
    id_12
);
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wand id_7;
  output wire id_6;
  and primCall (id_1, id_3, id_12, id_8, id_4, id_10, id_9, id_2, id_5, id_11);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_12,
      id_1,
      id_1,
      id_6,
      id_5,
      id_7,
      id_3,
      id_1,
      id_5,
      id_8,
      id_8,
      id_11,
      id_2,
      id_1,
      id_2,
      id_11,
      id_8,
      id_5,
      id_12,
      id_9,
      id_3,
      id_1
  );
  inout wire id_2;
  inout wire id_1;
  assign id_7 = id_2 ? id_4 : -1 != id_10;
endmodule
