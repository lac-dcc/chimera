// Seed: 3765055260
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11
);
  specify
    (id_13 => id_14) = 1;
    (id_15 => id_16) = ((1));
    specparam id_17 = id_3;
  endspecify
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1
    , id_7,
    output logic id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5
);
  wire [1 : -1] id_8;
  reg id_9;
  always @(*) id_9 = -1;
  logic [7:0] id_10;
  logic id_11;
  always_ff @(posedge id_4)
    if (1)
      id_2#(
          .id_7 (1),
          .id_3 (1'h0 - (1)),
          .id_11((1)),
          .id_4 (-1)
      ) = id_10;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_1,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
  assign id_8 = id_5;
  assign id_0 = id_3;
  wire  id_12 = id_10[1];
  logic id_13;
endmodule
