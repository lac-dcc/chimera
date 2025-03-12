// Seed: 4264485176
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input supply0 id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    input wor module_0,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    output wand id_10,
    output wand id_11,
    input tri0 id_12,
    input wand id_13,
    output tri1 id_14,
    output tri1 id_15,
    input wor id_16,
    input supply0 id_17,
    input supply1 id_18
);
  assign id_14 = 'b0 == id_13;
endmodule
module module_1 #(
    parameter id_3 = 32'd25
) (
    input tri0 id_0,
    input supply0 id_1,
    output wand id_2,
    input tri1 _id_3
);
  assign id_2 = ~id_3;
  wire [1 : -1  &&  id_3] id_5;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
  id_6 :
  assert property (@(posedge 1) id_5 ? id_5 : id_3)
  else $signed(85);
  ;
endmodule
