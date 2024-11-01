// Seed: 343433161
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
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_8 = 32'd63,
    parameter id_9 = 32'd0
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  module_0(
      id_5, id_3, id_7, id_3, id_7, id_3, id_6, id_1
  );
  assign id_7 = ~id_2;
  defparam id_8.id_9 = 1;
endmodule
