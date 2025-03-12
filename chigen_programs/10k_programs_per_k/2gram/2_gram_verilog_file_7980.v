// Seed: 1816575919
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_6;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd31
) (
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
  input wire id_7;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_6,
      id_9,
      id_5
  );
  output wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  genvar _id_10;
  assign id_4[id_10] = 1;
  logic id_11;
endmodule
