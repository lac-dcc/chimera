// Seed: 1222464569
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    output supply1 id_4
);
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1
);
  reg id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10;
  reg id_11 = id_7;
  always @(posedge 1) begin : LABEL_0
    if (id_3) id_10 <= id_5;
    else begin : LABEL_0
      if (id_3) id_6 = 1;
      else id_9 <= id_10 | id_0;
    end
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
