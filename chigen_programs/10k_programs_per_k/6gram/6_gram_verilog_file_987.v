// Seed: 1086017349
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
    id_23
);
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_19 = id_3;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    output tri id_2,
    output tri1 id_3,
    input tri id_4
    , id_8,
    input supply1 id_5,
    output tri1 id_6
    , id_9
);
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8
  );
  assign id_6 = -1'b0;
  assign id_0 = id_9;
  always @(posedge 1 or posedge id_5 ^ -1'b0) begin : LABEL_0
    id_0 = id_5;
  end
endmodule
