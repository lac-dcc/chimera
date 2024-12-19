// Seed: 3589690826
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    input uwire id_4,
    input wor id_5,
    input supply1 id_6,
    input wire id_7,
    input supply1 id_8
    , id_14,
    input wor id_9,
    input wor id_10,
    input supply1 id_11,
    output tri0 id_12
);
  wire id_15;
  id_16 :
  assert property (@(posedge 1) {id_7{1'b0}} * id_9)
  else begin : LABEL_0
    id_0 = id_10;
  end
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    output tri id_4,
    output supply0 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wor id_11,
    input wand id_12,
    input tri0 id_13,
    input wire id_14,
    input wor id_15,
    input wor id_16,
    input tri0 id_17,
    output wand id_18,
    output tri1 id_19,
    output wand id_20
);
  assign id_20 = 1'b0;
  module_0 modCall_1 (
      id_20,
      id_15,
      id_7,
      id_8,
      id_3,
      id_3,
      id_14,
      id_12,
      id_14,
      id_16,
      id_12,
      id_12,
      id_9
  );
  assign modCall_1.id_1 = 0;
  assign id_9 = 1;
  assign id_4 = id_13;
endmodule
