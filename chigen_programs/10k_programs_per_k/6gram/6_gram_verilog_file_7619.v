// Seed: 2702505318
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wire id_4,
    output tri id_5,
    output tri1 id_6,
    output supply1 id_7,
    output wire id_8,
    output wand id_9,
    output tri id_10,
    output logic id_11,
    input supply1 id_12,
    input wor id_13,
    input wire id_14
);
  always id_11 <= #1 1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input wor id_2,
    input uwire id_3,
    output logic id_4,
    input wire id_5,
    input uwire id_6,
    input tri id_7,
    input supply0 id_8,
    output tri0 id_9
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_7,
      id_9,
      id_9,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_3,
      id_3,
      id_2
  );
  always @(*) begin : LABEL_0
    if (id_5) id_4 <= id_2 == id_2 - id_6;
  end
endmodule
