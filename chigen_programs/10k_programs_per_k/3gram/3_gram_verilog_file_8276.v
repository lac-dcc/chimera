// Seed: 95421393
module module_0 (
    output tri id_0,
    input wor id_1,
    output tri1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    output supply0 id_7,
    output supply1 id_8,
    output tri id_9,
    output wand id_10
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wand id_3,
    output wire id_4,
    output tri1 id_5,
    input wor id_6,
    output logic id_7,
    output logic id_8,
    input tri1 id_9,
    input wire id_10,
    output tri1 id_11,
    output uwire id_12,
    input wand id_13,
    output tri1 id_14,
    input wand id_15
);
  id_17 :
  assert property (@(posedge id_15 - id_6) id_13)
  else if (1) begin : LABEL_0
    id_7 = 1;
  end
  xnor primCall (id_4, id_0, id_10, id_15, id_6, id_2, id_13, id_1);
  initial begin : LABEL_1
    id_8 = id_17;
  end
  module_0 modCall_1 (
      id_4,
      id_10,
      id_3,
      id_5,
      id_4,
      id_13,
      id_13,
      id_12,
      id_3,
      id_4,
      id_4
  );
endmodule
