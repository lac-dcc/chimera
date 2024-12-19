// Seed: 2792879931
module module_0 #(
    parameter id_8 = 32'd45,
    parameter id_9 = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  defparam id_8.id_9 = 1;
  assign id_3 = 1;
  wire id_10, id_11;
endmodule
module module_1 (
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
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5[1] = 1;
  wire id_10;
  assign id_9 = id_4;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_10,
      id_9,
      id_9,
      id_1,
      id_7
  );
  assign id_8[1'b0] = "";
endmodule
