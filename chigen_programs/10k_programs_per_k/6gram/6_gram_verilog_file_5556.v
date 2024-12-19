// Seed: 3329362751
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  integer id_6;
  wire id_7;
  wire id_8;
  assign module_1.id_1 = 0;
  wand id_9 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd46,
    parameter id_8 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_7.id_8 = id_5;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_1,
      id_9,
      id_4
  );
  wire id_10;
  assign id_1 = 1'd0 ^ 1;
endmodule
