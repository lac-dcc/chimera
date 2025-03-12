// Seed: 347507483
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
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_9;
endmodule
module module_1 #(
    parameter id_4 = 32'd80,
    parameter id_7 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_2,
      id_1,
      id_6
  );
  input wire _id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [id_4 : id_7] id_8;
endmodule
