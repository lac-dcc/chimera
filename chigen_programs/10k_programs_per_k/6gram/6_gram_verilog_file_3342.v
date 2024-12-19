// Seed: 2633087150
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
    id_16
);
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_17;
  wire id_18;
  assign module_1.type_0 = 0;
  assign id_15 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input logic id_2,
    output wor id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input wor id_8,
    input uwire id_9,
    input logic id_10,
    output tri0 id_11,
    input wand id_12
    , id_20,
    output wor id_13,
    output supply1 id_14,
    output tri0 id_15,
    output logic id_16,
    input tri1 id_17,
    output logic id_18
);
  assign id_14 = (1 == id_0);
  integer id_21;
  always @(posedge id_5) begin : LABEL_0
    id_16 <= id_10;
    deassign id_21.id_12;
    id_18 <= 1;
  end
  assign id_16 = id_2;
  module_0 modCall_1 (
      id_21,
      id_20,
      id_21,
      id_20,
      id_20,
      id_21,
      id_21,
      id_20,
      id_21,
      id_20,
      id_20,
      id_21,
      id_20,
      id_20,
      id_20,
      id_20
  );
endmodule
