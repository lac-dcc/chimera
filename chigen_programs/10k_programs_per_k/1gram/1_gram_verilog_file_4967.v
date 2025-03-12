// Seed: 25381270
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd23
) (
    id_1#(
        .id_2 (1'b0 + id_3),
        ._id_4(1),
        .id_5 (id_6)
    ),
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    \id_12
);
  input wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  input wire _id_4;
  output wire id_3;
  output reg id_2;
  output wire id_1;
  localparam id_13 = 1;
  assign id_1 = id_5;
  if (1) assign id_3 = ~-1;
  else always_comb id_2 <= -1;
  always id_2 = 1 == {id_8{id_11}} == id_5[""==id_4];
  assign \id_12 = id_10;
  module_0 modCall_1 (
      id_11,
      id_13,
      id_1,
      id_9
  );
  assign id_8 = id_9;
endmodule
