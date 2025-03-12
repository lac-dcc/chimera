// Seed: 3032558099
module module_0 #(
    parameter id_6 = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [id_6 : -1] id_14 = id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd17,
    parameter id_2 = 32'd64,
    parameter id_8 = 32'd21
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire _id_2;
  inout wire _id_1;
  wire id_5;
  logic [id_2 : -1] id_6;
  ;
  logic [7:0] id_7;
  parameter id_8 = 1 == 1;
  assign id_6 = (id_7[1-:1]);
  wire id_9;
  assign id_7[id_1==?-1] = 1;
  or primCall (id_3, id_6, id_8);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_9,
      id_5,
      id_9,
      id_8,
      id_9,
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_9
  );
endmodule
