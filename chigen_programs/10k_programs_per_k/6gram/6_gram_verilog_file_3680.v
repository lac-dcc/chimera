// Seed: 2696348622
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wand id_3,
    input wor id_4,
    output logic id_5,
    input supply0 id_6
);
  assign id_5 = 1;
  assign module_1.id_0 = 0;
  always @(*) id_5 <= 1'd0;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output tri id_2,
    output supply0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri1 id_7,
    input wor id_8,
    input wor id_9,
    output supply1 id_10,
    output logic id_11,
    input tri id_12,
    input tri1 id_13,
    output supply1 id_14,
    output wire id_15
);
  assign id_3 = 1;
  always @(*) begin : LABEL_0
    id_11 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_0,
      id_5,
      id_1,
      id_11,
      id_8
  );
endmodule
