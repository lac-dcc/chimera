// Seed: 835123448
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
    id_22
);
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_23;
  wire id_24;
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
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_22 = 'd0;
  always_latch @(posedge id_22 or posedge 1'h0) begin : LABEL_0
    id_6 <= id_2;
    `define pp_23 0
    id_22 = id_19;
    if (id_14) begin : LABEL_0
      id_16 <= id_13;
    end else id_19 <= 1;
  end
  wire id_24;
  or primCall (
      id_19,
      id_22,
      id_15,
      id_6,
      id_16,
      id_12,
      id_9,
      id_2,
      id_24,
      id_14,
      id_1,
      id_25,
      id_21,
      id_13,
      id_20,
      id_5,
      id_11
  );
  wire id_25;
  module_0 modCall_1 (
      id_24,
      id_11,
      id_18,
      id_25,
      id_17,
      id_25,
      id_15,
      id_25,
      id_24,
      id_9,
      id_24,
      id_10,
      id_24,
      id_8,
      id_10,
      id_9,
      id_15,
      id_4,
      id_21,
      id_4,
      id_14,
      id_24
  );
endmodule
