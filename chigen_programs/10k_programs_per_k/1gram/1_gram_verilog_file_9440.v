// Seed: 1457223953
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = (id_6);
  assign id_3 = id_6;
  assign id_1 = 1;
  assign module_1.id_4 = 0;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  xor primCall (id_2, id_4, id_3, id_5, id_1);
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_5,
      id_4,
      id_3
  );
  wire id_6;
  assign id_2 = ~id_5;
  wand id_7, id_8 = id_7;
  assign id_7 = 1;
endmodule
