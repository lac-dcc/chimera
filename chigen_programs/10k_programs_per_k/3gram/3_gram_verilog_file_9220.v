// Seed: 1411086894
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd63,
    parameter id_5 = 32'd60
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire _id_5;
  input wire id_4;
  output wire _id_3;
  output wire id_2;
  input wire id_1;
  struct packed {
    logic [id_3 : (  1  )] id_8;
    logic [id_3 : id_5] id_9;
  } [id_5 : -1 'b0] id_10;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_7,
      id_10,
      id_8,
      id_8,
      id_10,
      id_8,
      id_8,
      id_7,
      id_8
  );
  assign id_10.id_8 = 1;
  logic [1 : 1 'h0] id_11;
  ;
endmodule
