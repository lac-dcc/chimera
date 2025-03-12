// Seed: 821516627
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input wand id_3
);
  parameter id_5 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3
);
  logic id_5;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_2 = 32'd32
) (
    input supply1 id_0
    , id_17,
    input wand id_1,
    input tri _id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output supply0 id_7,
    input tri1 id_8,
    input wand id_9,
    output supply1 id_10,
    output wand id_11,
    input uwire id_12,
    input tri1 id_13,
    input wor id_14,
    output logic id_15
);
  nand primCall (id_4, id_3, id_14, id_18, id_17, id_9, id_6, id_12, id_8, id_1, id_0, id_5, id_13);
  always_ff @(1) id_15 = id_6;
  id_18 :
  assert property (@(posedge -1 < id_3) id_9)
  else $clog2(65);
  ;
  wire [1 : -1] id_19;
  module_0 modCall_1 (
      id_14,
      id_9,
      id_6,
      id_3
  );
  wire [id_2 : 1] id_20;
endmodule
