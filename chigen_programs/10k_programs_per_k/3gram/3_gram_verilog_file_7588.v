// Seed: 975831832
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input wor id_2,
    output supply0 id_3,
    input wand id_4,
    output wand id_5
);
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input wire id_4
);
  assign id_2 = 1'd0 - id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_3,
      id_2
  );
endmodule
module module_2 (
    input tri1 id_0,
    output wand id_1,
    input wire id_2,
    output supply0 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input uwire id_6,
    output logic id_7,
    input uwire id_8,
    output wor id_9,
    output tri0 id_10
);
  id_12 :
  assert property (@(1) id_12++)
  else begin : LABEL_0
    id_7 <= -1;
  end
  wire id_13;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9
  );
  assign modCall_1.id_4 = 0;
endmodule
