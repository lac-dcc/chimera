// Seed: 1883914462
module module_0 #(
    parameter id_10 = 32'd66,
    parameter id_13 = 32'd34
) (
    output supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    input uwire id_5#(
        .id_9  (1),
        ._id_10({1 + 1, -1, 1}),
        .id_11 (1),
        .id_12 (1),
        ._id_13(1),
        .id_14 (1)
    ),
    input tri1 id_6,
    input wor id_7
);
  logic id_15;
  wire  id_16;
  ;
  assign id_13 = id_13;
  assign id_12 = id_11 & -1;
  wire id_17;
  ;
  assign id_9  = id_11;
  assign id_11 = id_2;
  assign id_11 = id_13;
  wire id_18;
  assign id_12 = -1'b0;
  always assert (1);
  wire id_19, id_20;
  assign id_0 = 1;
  wire [id_10 : id_13] id_21;
  assign id_11 = id_21 - 1;
  logic id_22 = id_2;
  wire  id_23;
  always_latch $unsigned(id_13);
  ;
endmodule
module module_1 (
    output wire id_0,
    output supply0 id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    output wire id_6,
    input tri id_7,
    output wor id_8,
    output tri id_9
);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_7,
      id_5,
      id_7,
      id_7,
      id_2
  );
endmodule
