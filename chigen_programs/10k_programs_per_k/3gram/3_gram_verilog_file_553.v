// Seed: 856752273
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
    id_11
);
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always_ff @(posedge 1) begin : LABEL_0
    id_9 = 1;
  end
  wire id_12;
  assign id_12 = id_3;
  assign module_1.id_12 = 0;
  assign {id_5, id_3} = id_12;
  wire id_13, id_14;
  wire id_15;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    output tri0 id_2,
    output wand id_3,
    output tri0 id_4,
    input tri0 id_5,
    input wor id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    output wor id_10,
    input supply0 id_11,
    input wor id_12,
    input wor id_13,
    inout supply0 id_14,
    output tri1 id_15,
    input uwire id_16,
    input wire id_17,
    output tri id_18,
    input wor id_19,
    output tri1 id_20,
    input supply0 id_21
);
  assign id_18 = id_14++;
  assign id_3  = 1;
  always @(id_16) id_1 <= 1'b0;
  tri0 id_23 = 1;
  assign id_0  = 1;
  assign id_14 = 1;
  assign id_10 = id_7;
  tri0 id_24 = 1;
  wand id_25 = id_11;
  wire id_26;
  module_0 modCall_1 (
      id_23,
      id_23,
      id_26,
      id_23,
      id_23,
      id_24,
      id_23,
      id_23,
      id_26,
      id_23,
      id_24
  );
endmodule
