// Seed: 214278137
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    .id_9(id_5),
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_10;
  assign module_1.id_3 = 0;
  assign id_9 = ^id_3 == id_5[1];
endmodule
module module_1 #(
    parameter id_10 = 32'd2,
    parameter id_11 = 32'd31
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
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_7,
      id_1,
      id_8,
      id_5,
      id_7,
      id_7
  );
  id_9(
      1, 1 ^ id_4 ==? 1'h0, id_8[1] == 1 * 1 - id_1
  ); defparam id_10.id_11 = 1;
endmodule
