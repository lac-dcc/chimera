// Seed: 1338958639
module module_0 (
    output tri0 id_0,
    output tri1 id_1
);
  always @(*) begin : LABEL_0
    id_0 = id_3;
  end
  uwire id_4 = 1;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output logic id_5,
    input supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    output tri id_9,
    output wor id_10,
    input uwire id_11,
    input wor id_12
);
  initial begin : LABEL_0
    wait (1);
    if (1) for (id_1 = id_2 != 1'h0; id_8; id_1 = id_11) id_5 <= (1);
  end
  module_0 modCall_1 (
      id_9,
      id_10
  );
  assign modCall_1.type_5 = 0;
endmodule
