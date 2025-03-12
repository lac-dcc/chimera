// Seed: 2068227876
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output wand id_2,
    output supply0 id_3,
    input supply1 id_4
);
  id_6 :
  assert property (@(negedge 1) -1 !== id_4)
  else;
  wire id_7;
  wire id_8, id_9;
  assign id_3 = id_4;
  logic id_10;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    output wor id_7,
    input wor id_8,
    input supply0 id_9,
    output wor id_10,
    output logic id_11,
    input uwire id_12,
    input wand id_13
);
  generate
    wire id_15;
    always if (1 - -1'd0) id_11#(.id_3(1)) = -1;
    logic id_16 = id_9;
  endgenerate
  xnor primCall (id_1, id_5, id_13, id_9, id_15, id_16, id_3, id_8, id_6, id_2, id_12);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_10,
      id_10,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
