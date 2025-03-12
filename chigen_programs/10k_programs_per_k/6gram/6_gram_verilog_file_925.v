// Seed: 1957881821
module module_0 #(
    parameter id_2 = 32'd0,
    parameter id_3 = 32'd29,
    parameter id_4 = 32'd51
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire _id_4;
  inout wire _id_3;
  output wire _id_2;
  inout wire id_1;
  logic [1 : 1 'h0] id_7[1 : ~  id_2];
  wire [id_4 : 1  -  id_4] id_8, id_9, id_10;
  logic [1 : id_3] id_11;
endmodule
module module_1 #(
    parameter id_4 = 32'd40,
    parameter id_5 = 32'd26
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, _id_4;
  parameter id_5 = 1;
  wire id_6;
  wire [id_5 : id_4] id_7;
  assign id_3 = id_6;
  wire [id_5 : 1] id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_5,
      id_7,
      id_3
  );
  always force id_2 = {"", 1, 1 % id_8};
endmodule
