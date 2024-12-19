// Seed: 4058229490
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1;
  wire id_5;
  module_2 modCall_1 (
      id_1,
      id_3,
      id_5
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_2 <= ~1;
  integer id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_0.id_3 = 0;
endmodule
