// Seed: 2015223599
module module_0 #(
    parameter id_8 = 32'd7
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
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_7;
  always @(id_1 + 1) id_5 <= id_7;
  defparam id_8 = id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  initial id_4 <= 1'b0;
  wire id_8, id_9;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_2,
      id_9,
      id_4,
      id_6
  );
endmodule
