// Seed: 3524057916
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wor id_2,
    input tri0 id_3,
    input supply1 id_4
);
  always @(posedge 1) begin : LABEL_0
    if (1) id_6 = 1'b0;
    else release id_6;
  end
  assign module_1.id_8 = 0;
  tri id_7, id_8;
  assign id_7 = 1;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    output wor id_2,
    input wire id_3,
    input wor id_4,
    output wor id_5,
    input supply1 id_6,
    output wor id_7,
    output tri1 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3
  );
endmodule
