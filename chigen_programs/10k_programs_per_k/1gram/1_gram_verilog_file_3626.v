// Seed: 3860030331
module module_0 (
    id_1,
    id_2,
    id_3
);
  output tri0 id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  ;
  assign id_3 = 1;
  wire id_5;
  wire id_6, id_7;
  wire id_8;
  ;
  if (1) wire id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd51,
    parameter id_4 = 32'd31,
    parameter id_5 = 32'd21,
    parameter id_6 = 32'd37
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5,
    _id_6[id_2.id_6 : id_4]
);
  input logic [7:0] _id_6;
  inout wire _id_5;
  input wire _id_4;
  inout wire id_3;
  input wire _id_2;
  output wire id_1;
  localparam id_7 = 1;
  parameter id_8 = -1;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_8
  );
  localparam id_9 = id_7[id_5+id_2!="" :-1][1 : id_2];
endmodule
