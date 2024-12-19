// Seed: 1975455345
module module_0 (
    input wand id_0,
    input tri0 id_1
);
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    output wor id_2,
    output logic id_3,
    input wor id_4,
    input wand id_5,
    input wire id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    output wand id_12
);
  assign id_12 = 1'b0;
  module_0 modCall_1 (
      id_11,
      id_5
  );
  assign modCall_1.id_1 = 0;
  wire id_14;
  id_15 :
  assert property (@(posedge id_8) 1)
  else begin : LABEL_0
    id_3 <= 1 * id_5 - id_1 | 1'b0;
  end
endmodule
