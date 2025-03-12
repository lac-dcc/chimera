// Seed: 2618600463
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_1;
endmodule
program module_1 #(
    parameter id_11 = 32'd21,
    parameter id_3  = 32'd47,
    parameter id_6  = 32'd7
) (
    id_1,
    id_2#(
        ._id_3(1),
        .id_4 (id_5[_id_6[id_3 : 1'b0]]),
        .id_7 (1)
    ),
    id_8,
    id_9,
    id_10,
    _id_11
);
  inout logic [7:0] _id_6;
  input logic [7:0] id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_9,
      id_8
  );
  assign id_10 = id_10[-1 : id_11*-1];
endprogram
