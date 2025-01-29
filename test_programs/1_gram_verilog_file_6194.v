// Seed: 3744782175
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always deassign id_7;
  assign id_6 = id_2;
  parameter id_9 = id_3 - id_4;
  parameter id_10 = -1'b0;
  assign module_1.id_3 = 0;
  wire id_11, id_12;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  assign id_2 = (1 - id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_3 = id_2;
endmodule
