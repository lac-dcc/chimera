// Seed: 2622362931
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    output tri0  id_2
);
  integer id_4;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire id_4;
  nand primCall (id_3, id_2, id_1);
endmodule
