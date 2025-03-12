// Seed: 2639910260
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
    id_11,
    id_12
);
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_13;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd0,
    parameter id_5 = 32'd15
) (
    id_1,
    id_2
);
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1 = id_1[-1];
  logic [7:0] id_3;
  wire _id_4;
  genvar _id_5;
  assign id_3[id_5 : id_4] = id_1;
  supply1 id_6 = 1;
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_2
  );
endmodule
