// Seed: 3642043562
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5[1] = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd5,
    parameter id_8 = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1] = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_2,
      id_4
  );
  wire id_5, id_6;
  assign id_2 = 1;
  defparam id_7.id_8 = 1'b0 - id_3;
endmodule
