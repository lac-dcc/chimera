// Seed: 1239808376
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
    id_20
);
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_21;
  assign module_1.type_0 = 0;
  wire id_22;
  wire id_23;
  wire id_24;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    output uwire id_2,
    input tri1 id_3,
    output wand id_4,
    input supply1 id_5,
    input uwire id_6,
    input supply1 id_7,
    output wand id_8,
    input wor id_9,
    input uwire id_10,
    input tri id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  assign id_8 = id_3;
  always @(posedge id_13) begin : LABEL_0
    id_1 = 1 & id_10;
  end
endmodule
