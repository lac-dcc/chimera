// Seed: 2855125714
module module_0 (
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  wire id_11 = module_0;
endmodule
module module_1 #(
    parameter id_6 = 32'd10,
    parameter id_7 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_4,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5
  );
  defparam id_6.id_7 = id_3;
endmodule
