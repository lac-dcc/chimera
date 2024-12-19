// Seed: 2273716259
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_4;
endmodule
module module_1;
  wire id_2;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_4
  );
  assign id_4 = id_2;
  assign id_1 = id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign id_2[1] = 1;
endmodule
