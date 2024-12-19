// Seed: 3571295934
module module_0 (
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
  output wire id_1;
  wire id_6;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_3
  );
  wand id_7 = 1;
  assign id_2 = 1 & id_4 - id_5;
endmodule
