// Seed: 3857906861
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output uwire id_2,
    output tri1 id_3,
    input wire id_4,
    input supply1 id_5#(
        .id_12(1 || -1),
        .id_13(-1'd0),
        .id_14(-1),
        .id_15(1),
        .id_16(""),
        .id_17(1)
    ),
    output wor id_6,
    input tri0 id_7,
    input wor id_8,
    input uwire id_9,
    input wire id_10
    , id_18
);
  struct packed {
    logic [1 : -1] id_19;
    logic id_20;
    logic id_21;
  } id_22;
endmodule
module module_1 #(
    parameter id_1 = 32'd95
) (
    input tri0 id_0,
    input wire _id_1,
    output wand id_2,
    input supply1 id_3
);
  logic [7:0][1  &&  id_1  |  -1 : 1] id_5;
  assign id_2 = -1;
  wire id_6;
  wire [-1 'd0 : -1] id_7, id_8;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_7 = 0;
  wire id_9 = id_5[id_1] (1, id_8);
  wire id_10;
  wire id_11;
  ;
endmodule
