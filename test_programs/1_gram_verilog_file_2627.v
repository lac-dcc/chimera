// Seed: 2036880558
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always $display(-1'h0, id_4, id_4);
  wire id_5;
  assign id_3 = 1;
  wire id_6;
  assign id_5 = -1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_1
  );
  assign id_4 = id_1 & 1;
  localparam id_8 = -1;
endmodule
