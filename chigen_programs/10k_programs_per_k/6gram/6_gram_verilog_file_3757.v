// Seed: 3252046323
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    output tri0  id_3,
    input  wor   id_4
);
  always @(id_1 or 1, id_1, 1 or negedge 1) begin : LABEL_0
    assert (1);
  end
  assign module_3.id_15 = 0;
endmodule
module module_3 (
    output wor id_0,
    input uwire id_1,
    input wor id_2,
    output wor id_3,
    input supply0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wand id_9,
    output supply0 id_10,
    input wor id_11,
    input wire id_12,
    output wand id_13,
    input wand id_14,
    input tri0 id_15,
    input wand id_16,
    output tri1 id_17,
    output wor id_18,
    output wand id_19
);
  assign id_17 = id_4;
  module_2 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_13,
      id_6
  );
endmodule
