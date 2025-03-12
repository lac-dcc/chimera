// Seed: 269476695
module module_0 (
    output wor   id_0,
    output wand  id_1,
    output logic id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  tri0  id_6,
    input  tri0  id_7
);
  always @(posedge id_6 ^ id_3 == 1) begin : LABEL_0
    id_2 = id_5;
  end
  wire id_9;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output tri0 id_2,
    input supply0 id_3,
    output wire id_4,
    output wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    input tri1 id_11,
    input wand id_12,
    output supply1 id_13,
    output tri1 id_14,
    input wor id_15,
    input supply1 id_16,
    output supply0 id_17,
    output logic id_18,
    input tri id_19,
    output supply1 id_20
);
  always @* begin : LABEL_0
    id_18 = id_12;
  end
  module_0 modCall_1 (
      id_20,
      id_13,
      id_18,
      id_8,
      id_3,
      id_3,
      id_6,
      id_12
  );
  assign modCall_1.id_0 = 0;
endmodule
