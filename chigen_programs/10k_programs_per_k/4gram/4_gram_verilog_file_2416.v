// Seed: 3763357723
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6, id_7;
  localparam id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_4;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign id_3[-1] = id_3;
endmodule
