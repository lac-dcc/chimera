// Seed: 279102656
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output uwire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_4
  );
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_2 (
    output tri  id_0,
    output tri1 id_1,
    input  tri1 id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
