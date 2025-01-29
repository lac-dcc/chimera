// Seed: 2855061510
macromodule module_0 (
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
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_4 = 0;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_5 = id_4;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
module module_2 ();
  assign id_1 = -1;
  parameter id_2 = id_2;
endmodule
