// Seed: 3528369716
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
    .id_27(id_22),
    id_23,
    access,
    id_24,
    id_25
);
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge module_0 && id_21) begin : LABEL_0
    id_24 <= "";
    id_27 <= 1;
  end
  assign id_18 = 1 ~^ id_26;
  wire id_28;
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
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5[1] = id_7;
  initial begin : LABEL_0
    id_8 <= id_2[1|1];
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_1,
      id_9,
      id_4,
      id_6,
      id_7,
      id_7,
      id_1,
      id_3,
      id_7,
      id_1,
      id_1,
      id_7,
      id_6,
      id_1,
      id_3,
      id_7,
      id_1,
      id_7,
      id_1,
      id_1,
      id_7,
      id_8,
      id_3,
      id_1
  );
endmodule
