// Seed: 3225111372
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  nand primCall (id_5, id_3, id_4, id_2);
  output wire id_1;
  parameter [1 : 1] id_6 = 1'b0;
endmodule
module module_2 (
    input  wor  id_0,
    output tri1 id_1,
    input  wor  id_2
);
  logic id_4;
  uwire id_5 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
endmodule
