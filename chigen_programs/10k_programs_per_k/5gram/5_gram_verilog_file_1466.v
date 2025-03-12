// Seed: 1304559575
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    module_0,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1.id_4 = 0;
  inout wire id_2;
  input wire id_1;
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_2
  );
  wire [id_4 : 1] id_5 = id_4;
endmodule
