// Seed: 3723788414
module module_0 (
    output tri0 id_0,
    input supply0 id_1
);
  assign id_0 = 1'b0;
  assign module_1.id_1 = 0;
  supply0 id_3;
  for (id_4 = id_3; 1; id_4 = &id_4 && id_1 && 1) begin : LABEL_0
    wire id_5;
  end
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    output wor id_2,
    output tri1 id_3,
    output wand id_4,
    output wire id_5
);
  always #1 id_0 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  assign id_1 = 1;
endmodule
module module_3 (
    input supply0 id_0,
    output wand id_1,
    output wire id_2,
    output tri0 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6
);
  assign id_2 = 1;
  reg  id_8;
  wire id_9;
  always id_8 <= (1) + id_4 ^ 1'b0;
  wire id_10;
  id_11 :
  assert property (@(posedge id_6 & "" && 1) id_5)
  else;
  wire id_12;
  wor  id_13 = 1'b0, id_14;
  xnor primCall (id_2, id_11, id_8, id_15, id_13, id_12, id_5, id_6, id_9);
  wire id_15;
  wire id_16;
  module_2 modCall_1 (
      id_15,
      id_10,
      id_14
  );
  assign modCall_1.id_1 = 0;
  wire id_17;
  wire id_18;
endmodule
