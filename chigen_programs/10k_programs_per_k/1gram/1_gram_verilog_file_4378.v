// Seed: 1801649208
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
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd68,
    parameter id_4 = 32'd40,
    parameter id_7 = 32'd22
) (
    id_1,
    _id_2,
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
      id_6,
      id_3,
      id_6,
      id_5,
      id_5
  );
  output wire _id_4;
  input wire id_3;
  output wire _id_2;
  input wire id_1;
  wire id_8;
  wire [1 : 1] id_9, id_10;
  wire id_11;
  wire id_12;
  logic [7:0][^  1  !==  id_7 : 1 'b0] id_13[id_4 : id_2], id_14;
  assign id_14 = id_13[-1];
endmodule
