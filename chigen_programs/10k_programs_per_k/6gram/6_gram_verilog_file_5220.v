// Seed: 1284245091
module module_0 #(
    parameter id_4 = 32'd60,
    parameter id_5 = 32'd4
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_4.id_5 = id_4;
endmodule
module module_1 (
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
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  assign id_2 = id_5;
  module_0(
      id_4, id_6, id_7
  );
  wire id_8;
  nor (id_6, id_5, id_1, id_3);
endmodule
