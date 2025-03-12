// Seed: 3316063509
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wire id_2,
    output wor id_3,
    output wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wire id_8,
    input supply0 id_9,
    output tri1 id_10,
    output wand id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri1 id_14,
    input wor id_15,
    output tri id_16,
    output supply1 id_17,
    output wor id_18,
    output tri id_19,
    output uwire id_20,
    output tri0 id_21,
    output wand id_22,
    input tri0 id_23,
    input wand id_24,
    output wire id_25,
    input wor id_26,
    input tri0 id_27
);
  logic id_29 = {-1'd0 - -1, id_23};
  wire  id_30;
  parameter id_31 = -1'b0 ? -1 : 1;
  assign id_20 = 1;
  assign id_20 = "" < id_12;
  wire id_32, id_33;
  logic id_34;
  ;
  assign module_1.id_1 = 0;
  assign id_20 = id_26;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output tri0  id_5,
    output wor   id_6,
    output uwire id_7,
    input  wor   id_8,
    output tri   id_9,
    input  tri0  id_10,
    input  tri   id_11
);
  bit id_13;
  ;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_9,
      id_8,
      id_10,
      id_9,
      id_10,
      id_8,
      id_5,
      id_5,
      id_2,
      id_8,
      id_5,
      id_0,
      id_7,
      id_9,
      id_7,
      id_7,
      id_6,
      id_6,
      id_6,
      id_10,
      id_11,
      id_7,
      id_3,
      id_11
  );
  always @(id_8 or negedge id_1) begin : LABEL_0
    id_13 <= -1 == 1;
  end
  localparam id_14 = 1;
endmodule
