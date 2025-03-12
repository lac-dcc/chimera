// Seed: 545755503
module module_0 #(
    parameter id_11 = 32'd73,
    parameter id_5  = 32'd64
) (
    input wire id_0#(
        ._id_5(-1),
        .id_6 (1),
        .id_7 (1 ^ 1'h0),
        .id_8 (1),
        .id_9 (1),
        .id_10(-1)
    ),
    input supply0 id_1,
    output wire id_2,
    input uwire id_3
);
  logic _id_11;
  wire  id_12;
  assign module_1.id_0 = 0;
  wire id_13;
  wire id_14;
  wire [id_5 : id_11] id_15;
  assign id_10[1'b0] = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2
);
  wire id_4;
  and primCall (id_2, id_4, id_1, id_0);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1
  );
endmodule
