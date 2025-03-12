// Seed: 489524212
module module_0 #(
    parameter id_8 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  id_7 :
  assert property (@(negedge id_2[1==""], id_6) id_7)
  else id_7 = id_2;
  logic [1 'b0 : -1] _id_8, id_9;
  always id_7 = -1;
  assign id_8 = id_1;
  logic [id_8 : 1] id_10;
endmodule
module module_1 #(
    parameter id_2 = 32'd12
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  output wire id_1;
  wire [1 'b0 : id_2] id_3;
  logic [7:0] id_4;
  assign id_4 = ~id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_7 = 0;
  supply0 id_5 = 1'b0;
  always id_4[id_2] <= id_3;
endmodule
