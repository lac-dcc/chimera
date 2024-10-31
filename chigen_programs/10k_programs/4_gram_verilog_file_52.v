// Seed: 3349636288
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4;
  module_2();
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0(
      id_4, id_1
  );
endmodule
module module_2;
endmodule
module module_3 #(
    parameter id_12 = 32'd95,
    parameter id_13 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_8 = id_7;
  module_2();
  wire id_10;
  wire id_11;
  nor (id_1, id_3, id_4, id_5, id_6, id_7, id_9);
  generate
    defparam id_12.id_13 = 1;
  endgenerate
endmodule
