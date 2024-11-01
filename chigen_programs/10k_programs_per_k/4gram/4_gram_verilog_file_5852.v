// Seed: 3888226097
module module_0 #(
    parameter id_8 = 32'd46,
    parameter id_9 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    defparam id_8.id_9 = id_4 == 1 & id_5;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  module_0(
      id_3, id_2, id_2, id_1, id_3, id_2, id_3
  );
endmodule
