// Seed: 2257691375
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3.id_2 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always id_6 <= id_1 ^ id_2;
  wire id_7;
  nand primCall (id_6, id_5, id_1, id_2, id_3);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_7
  );
endmodule
program module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
