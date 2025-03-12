// Seed: 67056181
module module_0 (
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
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_3 = 32'd81,
    parameter id_5 = 32'd93
) (
    id_1,
    _id_2,
    _id_3[1 :-1],
    id_4,
    _id_5,
    id_6
);
  inout wire id_6;
  inout wire _id_5;
  inout wire id_4;
  inout logic [7:0] _id_3;
  input wire _id_2;
  inout wire id_1;
  assign id_6 = 1 == id_1;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_4,
      id_1,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6
  );
  wire [id_2  -  id_3  .  id_5 : 1] id_7;
  initial begin : LABEL_0
    id_6 -= id_7;
  end
  assign id_7 = id_4;
  logic id_8;
endmodule
