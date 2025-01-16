// Seed: 2676948845
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
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
  assign id_5 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_6 = id_2;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5
  );
  wire id_7 = id_5, id_8;
endmodule
