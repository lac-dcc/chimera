// Seed: 1733668334
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always_ff @(-1) $clog2(45);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_7,
      id_1,
      id_6,
      id_1
  );
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_8 = -1'b0;
  assign id_1 = id_6;
endmodule
