// Seed: 3106958927
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2
    , id_6,
    output uwire id_3,
    output supply1 id_4
);
  wire id_7;
  ;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output logic id_2,
    output tri1 id_3,
    input wand id_4,
    input supply0 id_5,
    output wire id_6,
    output logic id_7,
    input wand id_8,
    output wand id_9,
    input wor id_10,
    output wire id_11,
    input wor id_12,
    output wor id_13,
    input tri0 id_14,
    input tri id_15,
    input tri id_16,
    input wire id_17,
    output tri0 id_18,
    output wor id_19,
    input tri1 id_20,
    input wire id_21
);
  parameter id_23 = 1;
  logic id_24;
  nand primCall (
      id_19, id_15, id_14, id_23, id_21, id_17, id_5, id_24, id_20, id_10, id_0, id_8, id_4, id_1
  );
  module_0 modCall_1 (
      id_14,
      id_4,
      id_17,
      id_13,
      id_19
  );
  id_25 :
  assert property (@(posedge id_20) id_0)
  else begin : LABEL_0
    id_2 = id_16;
    if (id_23 & id_23 & id_23 & id_23) id_7 = 1'b0;
  end
endmodule
