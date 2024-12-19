// Seed: 256833799
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_10 = 32'd11,
    parameter id_9  = 32'd68
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_9.id_10 = id_4;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_8,
      id_7,
      id_5,
      id_1,
      id_1,
      id_1
  );
endmodule
