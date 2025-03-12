// Seed: 477170162
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input tri id_4,
    input uwire id_5
    , id_22,
    output uwire id_6,
    input supply0 id_7,
    output uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input supply1 id_12,
    input tri id_13,
    output supply0 id_14,
    output uwire id_15,
    output supply1 id_16,
    input supply1 id_17,
    input supply1 id_18,
    output wor id_19,
    output supply1 id_20
);
  for (id_23 = ""; id_13; id_22 = -1'd0) begin : LABEL_0
    assign id_15 = id_11;
  end
  always disable id_24;
  wire id_25;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1
);
  assign id_0 = ~-1;
  not primCall (id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_19 = 0;
endmodule
