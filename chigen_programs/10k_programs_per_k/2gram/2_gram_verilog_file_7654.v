// Seed: 3597360646
module module_0 (
    input  uwire id_0,
    output uwire id_1,
    output wor   id_2
);
endmodule
module module_1 (
    output tri1  id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  tri1  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    inout tri id_0,
    input tri id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri id_4
);
  assign id_0 = id_2;
  tri1 id_6;
  always begin : LABEL_0
    id_6 = id_6 - 1'h0 >> 1;
  end
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.type_4 = 0;
endmodule
