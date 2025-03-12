// Seed: 2579747811
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input uwire id_5
    , id_17,
    output wor id_6,
    output wor id_7,
    output tri id_8,
    input wor id_9,
    input wor id_10,
    output uwire id_11,
    input wire id_12,
    input tri id_13,
    output tri id_14
    , id_18,
    input wand id_15
);
  id_19 :
  assert property (@(posedge -1 or negedge 1) -1'd0)
  else;
  wire id_20 = id_9;
endmodule
program module_1 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    output supply0 id_8,
    input tri id_9,
    output tri id_10,
    output wor id_11,
    input uwire id_12,
    input wor id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4,
      id_9,
      id_4,
      id_3,
      id_8,
      id_11,
      id_12,
      id_9,
      id_10,
      id_7,
      id_12,
      id_8,
      id_1
  );
  assign modCall_1.id_7 = 0;
endprogram
