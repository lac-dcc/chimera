// Seed: 1179215970
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    output wire id_6,
    output wand id_7
);
  logic id_9;
  ;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    input wor id_4,
    input supply0 id_5,
    output tri0 id_6
);
  bit id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_1,
      id_6
  );
  initial begin : LABEL_0
    if (1)
      @(posedge id_5 + 1) begin : LABEL_1
        id_8 = -1;
      end
  end
endmodule
