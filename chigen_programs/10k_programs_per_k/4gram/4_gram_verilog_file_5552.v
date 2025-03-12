// Seed: 848818876
module module_0 (
    input tri id_0,
    output logic id_1,
    input supply0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input wire id_6,
    output logic id_7,
    output supply1 id_8,
    input wire id_9,
    input tri1 id_10,
    input uwire id_11
    , id_18,
    input wand id_12,
    output supply0 id_13,
    input tri0 id_14,
    output tri id_15,
    output wand id_16
);
  assign id_18 = id_2 ? id_9 : 1;
  always id_7 <= -1;
  assign module_1.id_13 = 0;
  initial begin : LABEL_0
    id_1 = 1;
  end
  assign id_18 = id_8++;
endmodule
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    output wor id_5,
    output uwire id_6,
    input wor id_7,
    input supply0 module_1,
    input tri1 id_9,
    input tri1 id_10,
    output wor id_11,
    inout supply1 id_12,
    output logic id_13,
    input wor id_14
);
  module_0 modCall_1 (
      id_7,
      id_13,
      id_12,
      id_6,
      id_4,
      id_11,
      id_3,
      id_13,
      id_11,
      id_14,
      id_10,
      id_2,
      id_3,
      id_1,
      id_0,
      id_12,
      id_5
  );
  always_ff @(posedge id_4 < id_12) begin : LABEL_0
    id_13 = id_12;
  end
endmodule
