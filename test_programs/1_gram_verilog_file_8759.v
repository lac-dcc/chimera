// Seed: 2007142349
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_6, id_7;
  wire id_8;
  wire id_9 = 1 & id_7, id_10;
  assign id_1 = id_9;
  assign id_6 = 1;
  always #1 id_5[1] = -1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_9,
      id_9,
      id_6
  );
endmodule
