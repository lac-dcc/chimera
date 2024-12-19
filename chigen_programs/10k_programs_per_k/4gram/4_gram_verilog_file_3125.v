// Seed: 1836757980
module module_0 #(
    parameter id_6 = 32'd86,
    parameter id_7 = 32'd65
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_5;
  defparam id_6.id_7 = {
    1, 1
  };
  wire id_8;
  assign id_5[1] = id_7;
  id_9(
      .id_0()
  );
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
