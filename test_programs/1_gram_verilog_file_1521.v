// Seed: 2817859427
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output wire id_2,
    output wand id_3,
    input wor id_4,
    inout tri1 id_5,
    output tri id_6,
    input tri0 id_7,
    output supply1 id_8,
    output supply1 id_9,
    output tri1 id_10,
    input tri id_11,
    output tri0 id_12,
    input supply0 id_13,
    output supply1 id_14,
    output supply0 id_15,
    input supply1 id_16,
    input tri1 id_17,
    inout supply0 id_18,
    output supply1 id_19,
    output tri1 id_20,
    input wor id_21,
    input uwire id_22,
    output wor id_23,
    input wor id_24
);
  wire id_26;
  assign module_1.id_0 = 0;
  wire id_27;
endmodule
module module_1 (
    output wor   id_0,
    inout  tri   id_1,
    output tri1  id_2,
    output tri0  id_3,
    output uwire id_4
);
  tri1 id_6;
  assign id_0 = id_6 & 1 - id_1;
  for (id_7 = -1'b0; 1; id_4 = id_7) begin : LABEL_0
    assign id_4 = id_6;
  end
  xnor primCall (id_2, id_1, id_6, id_7);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_2,
      id_6,
      id_1,
      id_1,
      id_1,
      id_2,
      id_6,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1,
      id_7,
      id_1,
      id_6,
      id_1,
      id_7,
      id_1,
      id_6,
      id_7,
      id_4,
      id_1
  );
endmodule
