// Seed: 1732801421
module module_0 (
    input wor   id_0,
    input tri0  id_1,
    input uwire id_2
);
  tri1 id_4 = 1;
  wire id_5;
  wire id_6;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3
);
  tri1 id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  always_latch
    for (id_5 = id_2; 1; id_6 = id_2) begin : LABEL_0
      id_1 = id_3;
      id_1 = 1;
    end
  assign {1, id_2} = id_3;
  assign id_1 = 1;
endmodule
