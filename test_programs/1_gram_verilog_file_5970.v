// Seed: 3159559156
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_1 = 1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  assign id_2 = id_3;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2[1] = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
