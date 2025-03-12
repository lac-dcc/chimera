// Seed: 3428202106
module module_0 (
    output supply1 id_0
    , id_6,
    output supply0 id_1,
    output wire id_2,
    input wire id_3,
    input tri0 id_4
);
  generate
    integer id_7 = id_7;
  endgenerate
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1,
    input wor id_2,
    input supply0 id_3,
    output wand id_4,
    output supply0 id_5,
    output wand id_6,
    input supply0 id_7,
    input tri1 id_8,
    output uwire id_9,
    output wire id_10,
    input wand id_11,
    output supply1 id_12,
    output tri1 id_13,
    output wand id_14,
    input supply1 id_15,
    input tri id_16,
    input wor id_17,
    output tri0 id_18,
    input uwire id_19,
    input wor id_20,
    output uwire id_21,
    input wor id_22,
    output supply1 id_23,
    input wor id_24,
    input wor id_25,
    input wire id_26,
    input tri id_27,
    output wor id_28
);
  localparam id_30 = -1 != 1;
  if (1) assign id_4 = id_22 - id_27 & id_17 & id_23++;
  else begin : LABEL_0
    assign id_6 = {id_27{id_2}};
  end
  nand primCall (
      id_21,
      id_16,
      id_15,
      id_8,
      id_26,
      id_25,
      id_7,
      id_0,
      id_19,
      id_24,
      id_20,
      id_11,
      id_2,
      id_17,
      id_30
  );
  module_0 modCall_1 (
      id_6,
      id_23,
      id_18,
      id_22,
      id_22
  );
  assign modCall_1.id_3 = 0;
  wire id_31;
  ;
endmodule
