// Seed: 1009135495
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output tri1 id_2,
    output uwire id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    input tri id_7,
    output tri1 id_8,
    input uwire id_9,
    input supply1 id_10,
    input wand id_11,
    input tri id_12,
    output wor id_13
);
  logic id_15;
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    output wand  id_2,
    input  uwire id_3
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2
  );
  logic [1 : 1] id_5;
  always @(posedge 1) begin : LABEL_0
    fork
      for (id_2 = 1 !=? 1; 1'b0; id_5 = id_5) begin : LABEL_1
        $unsigned(42);
        ;
        id_1 <= -1;
        assume (id_3 & id_5);
        if ((1 + -1)) id_1 <= (id_3) ^ "";
      end
      SystemTFIdentifier;
    join
  end
endmodule
