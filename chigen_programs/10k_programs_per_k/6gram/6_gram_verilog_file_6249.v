// Seed: 151519486
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  assign id_6 = id_1;
  wire id_7, id_8;
  xor primCall (id_4, id_1, id_2, id_3, id_8);
  module_2 modCall_1 (
      id_3,
      id_6,
      id_6
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4 = id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_4 = id_3;
  always @(*) force id_4 = id_3 & 1;
  wire id_5;
endmodule
