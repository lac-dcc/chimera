// Seed: 1538103005
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output uwire id_2;
  not primCall (id_4, id_1);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_1,
      id_1
  );
  inout wire id_1;
  assign id_2 = 1'b0 == !id_3;
  wire id_5;
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_3;
endmodule
