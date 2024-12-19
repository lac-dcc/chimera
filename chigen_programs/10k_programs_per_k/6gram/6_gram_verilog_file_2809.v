// Seed: 1008922875
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_6 ? id_5 : 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd25,
    parameter id_9 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  defparam id_8.id_9 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_1,
      id_6,
      id_6,
      id_7,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
