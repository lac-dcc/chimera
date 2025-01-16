// Seed: 713500746
module module_0 (
    output wire id_0,
    input tri id_1 id_17,
    output supply1 id_2,
    input wor id_3,
    input wor id_4,
    id_18,
    input wire id_5,
    output wand id_6,
    input wire id_7,
    input supply1 id_8,
    output tri1 id_9,
    output tri0 id_10,
    input supply0 id_11,
    input tri id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wire id_15
);
  supply0 id_19 = 1 == id_18;
  assign id_13 = id_12;
  uwire id_20, id_21, id_22;
  tri id_23;
  assign id_2 = -1'd0;
  always @(*) begin : LABEL_0
    id_2 = id_23;
  end
  assign id_0  = 1;
  assign id_10 = id_20;
  wire id_24, id_25;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input logic id_2,
    output logic id_3,
    input wire id_4,
    output logic id_5,
    input supply1 id_6,
    input supply1 id_7,
    output tri id_8,
    input wand id_9,
    input wire id_10,
    input wire id_11,
    input supply1 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    input wire id_16,
    input tri0 id_17,
    input tri1 id_18,
    input logic id_19,
    input tri id_20,
    input wire id_21,
    input wire id_22,
    output tri1 id_23,
    input tri id_24,
    output logic id_25
);
  wire id_27;
  module_0 modCall_1 (
      id_23,
      id_11,
      id_23,
      id_11,
      id_12,
      id_4,
      id_8,
      id_14,
      id_10,
      id_8,
      id_23,
      id_1,
      id_17,
      id_8,
      id_12,
      id_24
  );
  assign modCall_1.type_7 = 0;
  final begin : LABEL_0
    id_3 <= -1'h0;
    id_5 <= id_19;
    begin : LABEL_0
      id_25 <= -1;
    end
    if (1'b0) id_25 = -1;
  end
  id_28();
  assign id_5 = id_2;
  nand primCall (id_3, id_17, id_27, id_22, id_10, id_12, id_18, id_16, id_13);
  tri0 id_29 = 1;
endmodule
