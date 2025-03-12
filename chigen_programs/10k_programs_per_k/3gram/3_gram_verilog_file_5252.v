// Seed: 2962494952
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    wand id_8 = -1'd0;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[1] = id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_4,
      id_1,
      id_4,
      id_5
  );
endmodule
