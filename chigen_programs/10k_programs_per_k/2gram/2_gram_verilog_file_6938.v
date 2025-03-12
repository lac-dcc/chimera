// Seed: 908306608
module module_0 (
    input  uwire id_0,
    input  tri   id_1#(.id_5(1)),
    input  tri0  id_2,
    output wire  id_3
);
  wire id_6;
  ;
  parameter id_7 = 1;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd37
) (
    output tri id_0,
    output tri0 id_1,
    output tri id_2,
    input tri0 id_3
    , id_14,
    input tri1 id_4,
    input tri0 id_5#(
        .id_15(-1'b0),
        .id_16(1)
    ),
    input uwire id_6,
    output uwire id_7,
    input wire _id_8,
    output supply1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input supply0 id_12
);
  union packed {
    logic id_17;
    id_18 id_19;
    logic id_20;
  } id_21;
  ;
  parameter id_22 = 1;
  supply1 id_23 = 1;
  assign id_21 = id_21.id_19[id_8];
  assign id_0  = id_14;
  assign id_16 = id_21.id_17;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_3,
      id_2
  );
  assign id_10 = (1);
endmodule
