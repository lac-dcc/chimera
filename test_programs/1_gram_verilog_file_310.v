// Seed: 174480977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_7 = (1);
  assign module_1.id_2 = 0;
endmodule
macromodule module_1 (
    input uwire id_0
);
  assign id_2 = 1 == id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  initial @(id_5) id_6 <= -1;
  assign id_6 = id_3;
  localparam id_7 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_7,
      id_1,
      id_4,
      id_1
  );
  initial id_5[-1'b0] = 1;
endmodule
