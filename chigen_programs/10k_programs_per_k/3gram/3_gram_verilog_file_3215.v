// Seed: 4020051694
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    output wire id_4,
    output wor id_5
    , id_8,
    input tri0 id_6
);
  logic [-1 : 1] id_9 = id_9;
  if (-1) begin : LABEL_0
    assign id_1 = 1'b0;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input uwire id_3,
    input wand id_4,
    output tri0 id_5,
    input uwire id_6,
    output wor id_7,
    input tri0 id_8,
    input wire id_9,
    output wand id_10,
    output logic id_11,
    output wire id_12,
    input wand id_13
    , id_18,
    input tri id_14,
    input tri0 id_15,
    input wire id_16
);
  id_19 :
  assert property (@(id_3) -1'b0)
  else begin : LABEL_0
    id_11 = id_13;
    while (id_3) assert (id_16);
    `define pp_20 0
  end
  assign id_5 = 1;
  nor primCall (id_7, id_6, id_19, id_0, id_13, id_16, id_14, id_3, id_9, id_15, id_8);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_9,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
