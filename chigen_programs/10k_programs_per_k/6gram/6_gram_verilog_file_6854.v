// Seed: 237668750
module module_0 (
    input supply1 id_0,
    output logic id_1,
    output tri0 id_2,
    output wor id_3,
    output tri id_4,
    output supply1 id_5,
    output uwire id_6
);
  always @(posedge -1) begin : LABEL_0
    id_1 = id_0;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    output wand id_7,
    input supply0 id_8,
    input tri1 id_9,
    input tri id_10,
    output logic id_11,
    input wor id_12,
    input tri1 id_13,
    output supply1 id_14
);
  assign id_11 = 1 == {1{id_3}};
  always @(id_8) id_11 <= 1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_14,
      id_14,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_0 = 0;
endmodule
