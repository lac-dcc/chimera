// Seed: 3860769340
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout tri0 id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  assign id_6 = 1 & 1 & id_4;
  parameter id_13 = -1;
  parameter id_14 = (id_13);
endmodule
module module_1 #(
    parameter id_2 = 32'd60
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  input wire _id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout wire id_1;
  not primCall (id_3, id_1);
  static integer [id_2 : -1] id_4;
endmodule
