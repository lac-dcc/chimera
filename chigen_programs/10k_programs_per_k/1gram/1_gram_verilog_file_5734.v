// Seed: 480682046
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_4 = id_3, id_5;
  module_2 modCall_1 ();
  wire id_6;
  assign id_5 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  wire id_6 = id_5;
  always id_4 = 1;
endmodule
module module_2;
  assign module_0.id_4 = 0;
  assign id_1 = 1;
endmodule
