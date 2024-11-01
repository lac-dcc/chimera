// Seed: 3582411989
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
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    assign id_2 = 1;
  endgenerate
  module_0(
      id_3, id_1, id_6, id_2, id_7, id_2, id_2
  );
  generate
    assign id_8 = id_2;
  endgenerate
  xor (id_2, id_4, id_5, id_3);
endmodule
