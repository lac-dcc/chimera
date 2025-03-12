// Seed: 4103956844
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input supply0 id_2,
    input uwire id_3,
    output supply0 id_4,
    input tri id_5,
    output tri id_6
);
  logic id_8;
  module_2 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_0
  );
endmodule
module module_1 (
    inout wand id_0,
    output logic id_1,
    output supply0 id_2
);
  always @(1'h0) begin : LABEL_0
    id_0 += -1;
    id_1 = id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output wor   id_0,
    input  tri   id_1,
    output wand  id_2,
    output uwire id_3
);
  assign module_0.id_6 = 0;
endmodule
