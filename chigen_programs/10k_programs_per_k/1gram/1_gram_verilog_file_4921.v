// Seed: 3473831722
module module_0 (
    id_1#(.id_2(1)),
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  assign id_1[1] = 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_4,
      id_5
  );
endmodule
