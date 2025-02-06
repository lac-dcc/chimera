// Seed: 2765545967
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_1 = 1 + id_2 ? id_2 : -1;
  endgenerate
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
