// Seed: 2649494118
macromodule module_0 #(
    parameter id_7 = 32'd59,
    parameter id_8 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  assign id_3 = 1;
  wire id_6;
  defparam id_7.id_8 = id_8;
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  genvar id_4;
  module_0(
      id_3, id_3, id_4, id_4
  );
endmodule
