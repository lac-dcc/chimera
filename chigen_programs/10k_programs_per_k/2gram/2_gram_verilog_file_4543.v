// Seed: 3678473417
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_7 = 1;
  genvar id_8;
  assign module_1.id_4 = 0;
  wire id_9;
endmodule
module module_1 #(
    parameter id_8 = 32'd64,
    parameter id_9 = 32'd43
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_8.id_9 = id_5;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_4,
      id_4,
      id_4
  );
endmodule
