// Seed: 1317999603
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  assign id_2 = 1;
  assign module_1.id_3 = 0;
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
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign id_3 = 1 | id_2;
endmodule
