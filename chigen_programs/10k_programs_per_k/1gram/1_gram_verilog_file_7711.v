// Seed: 115315788
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always id_4 = 1 * id_2;
  wire id_5;
  wire id_6;
  assign id_3 = 1'b0;
endmodule
