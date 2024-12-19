// Seed: 1315600098
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
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_2 || 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd17,
    parameter id_8 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_1,
      id_2,
      id_3,
      id_2
  );
  defparam id_7.id_8 = !id_5;
endmodule
