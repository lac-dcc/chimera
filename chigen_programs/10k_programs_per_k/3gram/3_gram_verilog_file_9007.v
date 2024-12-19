// Seed: 1127756616
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  assign module_2.id_1 = 0;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_2
  );
endmodule
module module_2;
  integer id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
