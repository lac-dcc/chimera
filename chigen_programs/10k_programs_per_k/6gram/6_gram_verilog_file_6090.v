// Seed: 439393315
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7 = id_6 == 1 && id_3 && id_6 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = (1'b0);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_4,
      id_1,
      id_2
  );
  assign id_2 = 1 < 1;
endmodule
