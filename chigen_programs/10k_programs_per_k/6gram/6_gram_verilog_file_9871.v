// Seed: 218183538
module module_0 #(
    parameter id_7 = 32'd98,
    parameter id_8 = 32'd25
) (
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
  output wire id_3;
  output wire id_2;
  input wire id_1;
  defparam id_7.id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  assign id_2[1] = 1'b0;
  assign id_1 = id_4 & 1 ? (1) : id_3;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_5,
      id_4,
      id_5
  );
  wire id_6;
  wire id_7;
  wire id_8 = 1;
  assign id_8 = 1;
endmodule
