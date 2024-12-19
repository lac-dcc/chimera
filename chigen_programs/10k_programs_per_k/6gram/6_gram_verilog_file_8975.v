// Seed: 2192406544
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_2,
      id_2,
      id_1
  );
  wire id_6;
  assign id_4[1'b0] = !0;
endmodule
