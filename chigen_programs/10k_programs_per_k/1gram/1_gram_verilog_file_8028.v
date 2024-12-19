// Seed: 2073976004
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire  id_3;
  uwire id_4 = 1;
  assign id_4 = 1 ? 1 : 1'b0;
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_5 = 32'd70
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_3;
  assign id_2.id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
  integer id_4 (
      id_2,
      1'b0
  );
  defparam id_5 = 1;
endmodule
