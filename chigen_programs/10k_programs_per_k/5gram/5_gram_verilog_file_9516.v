// Seed: 3959405753
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input tri1 id_4,
    output wor id_5,
    input supply1 id_6,
    input uwire id_7,
    output tri id_8,
    output tri id_9,
    input supply0 id_10,
    input supply1 id_11,
    input tri0 id_12,
    input wand id_13,
    input tri id_14,
    output tri1 module_0
);
  wire id_17;
  assign module_1.type_17 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri id_5,
    input wand id_6,
    input uwire id_7,
    input supply0 id_8,
    input tri id_9,
    input wand module_1,
    input tri1 id_11,
    input wor id_12
);
  wor id_14 = id_10;
  always @(posedge {1{id_6}} == 1) begin : LABEL_0
    assume (1);
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_8,
      id_3,
      id_12,
      id_14,
      id_7,
      id_14,
      id_4,
      id_5,
      id_1,
      id_0,
      id_6,
      id_8,
      id_8,
      id_14
  );
endmodule
