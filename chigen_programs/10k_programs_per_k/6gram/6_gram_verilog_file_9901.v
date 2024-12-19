// Seed: 1173398774
module module_0 #(
    parameter id_8 = 32'd35,
    parameter id_9 = 32'd95
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
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  assign id_6 = id_2;
  defparam id_8.id_9 = id_8;
  wire id_10;
endmodule
module module_1 (
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
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1)
    if (id_8) id_2 <= id_5;
    else id_3 = id_5 == 1;
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7,
      id_4
  );
endmodule
