// Seed: 1032664053
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout tri id_2;
  inout wire id_1;
  wire id_9;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output reg id_3;
  inout wire id_2;
  output wire id_1;
  always id_3 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
