// Seed: 989346338
module module_0 (
    input tri id_0
    , id_12,
    input wand id_1,
    output tri id_2,
    input supply0 id_3,
    input wor id_4,
    output tri id_5,
    input wor id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9,
    input supply0 id_10
);
  assign id_2 = 1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  wand id_0,
    output wire id_1,
    output wand id_2
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0
  );
  wire id_4;
endmodule
module module_2 (
    output wand  id_0,
    output uwire id_1,
    output tri1  id_2
);
  wand id_4, id_5;
  assign id_0 = id_5;
  reg id_6;
  xnor primCall (id_0, id_4, id_5, id_7, id_8, id_6);
  wor  id_7;
  wire id_8;
  always @(negedge id_9) begin : LABEL_0
    id_6 <= 1;
    `define pp_10 0
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
