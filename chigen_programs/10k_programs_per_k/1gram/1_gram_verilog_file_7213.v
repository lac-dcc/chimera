// Seed: 678999576
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = !id_1;
  assign id_3 = 1'b0 || id_6;
  always id_5 <= 1;
  assign module_1.id_1 = 0;
  wire id_7;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_1 <= id_2;
  wire id_4;
  initial id_2 <= 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_2,
      id_4
  );
endmodule
