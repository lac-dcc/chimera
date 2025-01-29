// Seed: 10334116
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_2 modCall_1 (id_3);
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1
  );
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  assign id_2 = id_2;
  assign module_0.id_2 = 0;
  assign id_3 = 1;
  wire id_4;
  parameter id_5 = -1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  assign id_3 = id_2.id_4;
  wire id_5;
  module_2 modCall_1 (id_4);
endmodule
