// Seed: 951686526
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
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  assign module_1.id_21 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wand id_2,
    input tri id_3,
    output wire id_4,
    output wor id_5,
    input logic id_6,
    input wor id_7,
    input wor id_8,
    output uwire id_9,
    input uwire id_10,
    input uwire id_11,
    input supply0 id_12,
    output tri id_13,
    input tri id_14,
    output supply1 id_15
);
  logic id_17, id_18, id_19;
  logic   id_20;
  supply0 id_21;
  always @(posedge id_1)
    if (id_6) begin : LABEL_0
      id_20 <= 1;
      if (id_6) begin : LABEL_0
        id_21 = id_1;
      end
    end
  assign id_18 = id_20;
  wire id_22;
  assign id_20 = 1 ? id_6 : 1;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22
  );
  wire id_23;
endmodule
