// Seed: 3013420556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2
  );
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = -1;
endmodule
module module_2 #(
    parameter id_10 = 32'd35,
    parameter id_3  = 32'd47
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire _id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire _id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = id_7;
  logic [id_10 : 1] id_15;
  ;
  parameter id_16 = 1;
  nor primCall (id_5, id_9, id_8, id_15, id_2, id_6, id_12, id_16, id_13, id_7, id_14);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5
  );
  logic [7:0] id_17;
  assign id_17[!id_3||id_10||1||1-:-1] = id_15;
endmodule
