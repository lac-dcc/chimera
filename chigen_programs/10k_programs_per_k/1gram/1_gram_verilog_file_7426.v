// Seed: 3527799056
module module_0 ();
  wire id_1, id_2;
  assign module_2.id_1 = 0;
endmodule
module module_1;
  logic id_1;
  wire id_2, id_3, id_4;
  module_0 modCall_1 ();
  always_ff $signed(63);
  ;
endmodule
module module_2 ();
  logic id_1;
  wire id_2, id_3, id_4;
  module_0 modCall_1 ();
  assign id_1 = -1;
endmodule
module module_3 #(
    parameter id_11 = 32'd40,
    parameter id_2  = 32'd47
) (
    id_1#(
        ._id_2(1),
        .id_3 (-1'b0),
        .id_4 (-1),
        .id_5 (id_6)
    ),
    id_7,
    id_8[id_11 : id_2],
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    .id_16(id_11),
    id_2,
    id_1
);
  output wire id_13;
  output wire id_12;
  input wire _id_11;
  inout wire id_10;
  inout wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  module_0 modCall_1 ();
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  wire id_17;
endmodule
