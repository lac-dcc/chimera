// Seed: 504996708
module module_0 (
    input wor id_0,
    output wire id_1,
    input supply0 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output supply1 id_5,
    input wire id_6,
    output supply1 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input wand id_11,
    input tri1 id_12,
    output supply0 id_13,
    output tri0 id_14,
    input wire id_15,
    output wire id_16,
    output uwire id_17,
    output uwire id_18
    , id_23,
    input tri id_19,
    input tri id_20
    , id_24,
    output tri0 id_21
);
  for (id_25 = id_10; id_11; id_5 = 1) begin : LABEL_0
    id_26 :
    assert property (@(posedge 1) id_15)
    else;
  end
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input wand id_3,
    output supply0 id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    input wire id_9,
    input wire id_10,
    output supply1 id_11,
    output tri id_12
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_4,
      id_11,
      id_12,
      id_7,
      id_12,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_2,
      id_4,
      id_7,
      id_2,
      id_11,
      id_11,
      id_7,
      id_6,
      id_11
  );
  assign modCall_1.id_3 = 0;
endmodule
