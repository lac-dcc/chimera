// Seed: 4112019406
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  localparam id_5 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  integer id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_2
  );
  assign id_1 = !{id_2};
  always id_4 <= 1;
endmodule
