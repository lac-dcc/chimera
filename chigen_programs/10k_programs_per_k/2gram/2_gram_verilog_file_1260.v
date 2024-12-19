// Seed: 1568225950
module module_0 (
    input tri id_0,
    input wand id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri id_8,
    output wor id_9,
    input supply1 id_10,
    output supply1 id_11,
    output wire id_12,
    input tri1 id_13,
    input tri0 id_14,
    input wand id_15,
    input supply0 id_16,
    output tri0 id_17,
    output supply0 id_18,
    input tri id_19,
    output wand id_20,
    output tri1 id_21,
    output wor id_22,
    input wor id_23
);
  assign id_11 = id_2;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output wand id_0,
    output logic id_1,
    input supply0 id_2,
    input supply0 id_3,
    input logic id_4,
    input wor id_5,
    input supply1 id_6,
    input logic id_7,
    input supply1 id_8,
    input logic id_9,
    output wor id_10,
    output logic id_11
);
  final begin : LABEL_0
    id_1 <= 1;
    @(id_7) begin : LABEL_0
      id_1  <= 1'd0;
      id_11 <= 1;
    end
  end
  module_0 modCall_1 (
      id_5,
      id_3,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_10,
      id_10,
      id_0,
      id_2,
      id_10,
      id_0,
      id_3,
      id_3,
      id_5,
      id_5,
      id_0,
      id_0,
      id_3,
      id_10,
      id_0,
      id_0,
      id_8
  );
  wire id_13;
endmodule
