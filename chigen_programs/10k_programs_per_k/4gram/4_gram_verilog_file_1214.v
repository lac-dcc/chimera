// Seed: 3942476513
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input wand id_5,
    output supply0 id_6,
    input wor id_7,
    output tri0 id_8,
    output wand id_9,
    input wand id_10,
    input supply0 id_11,
    input wor id_12,
    output wor id_13
);
  assign id_13 = 1'h0;
  logic id_15 = ((id_7));
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input tri id_6,
    input wand id_7
);
  for (id_9 = -1; id_6; id_0 = id_9) begin : LABEL_0
    for (id_10 = id_9 >= id_6; id_6; id_5 += -1) begin : LABEL_1
      logic id_11;
      ;
    end
  end
  module_0 modCall_1 (
      id_7,
      id_1,
      id_1,
      id_3,
      id_6,
      id_1,
      id_5,
      id_1,
      id_3,
      id_4,
      id_1,
      id_7,
      id_7,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
