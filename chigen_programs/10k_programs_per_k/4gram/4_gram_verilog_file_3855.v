// Seed: 3947864385
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output uwire id_4,
    output supply1 id_5,
    output tri module_0,
    output supply0 id_7,
    input supply1 id_8,
    output wor id_9,
    output tri1 id_10,
    output supply1 id_11,
    output wand id_12,
    input tri1 id_13
);
  id_15(
      id_5, 1, id_7
  );
endmodule
module module_1 (
    output tri1  id_0,
    input  logic id_1,
    output logic id_2,
    input  wor   id_3
);
  reg id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_23 = 0;
  initial begin : LABEL_0
    id_2 <= id_1;
  end
  always @(1 or id_5) begin : LABEL_0
    id_2 <= id_5;
  end
  wire id_7;
  wire id_8;
endmodule
