// Seed: 2236773722
module module_0 (
    output wand  id_0,
    input  uwire id_1,
    output tri1  id_2,
    output wand  id_3,
    input  wor   id_4
);
  assign id_2 = 1;
  reg id_6 = ~id_6 != id_6;
  always_comb @(posedge 1'd0 or posedge 1) begin : LABEL_0
    if (id_0++)
      if (id_4) id_6 <= 1;
      else id_6 <= 1;
  end
  wire id_7 = id_2++, id_8;
endmodule
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    output supply1 module_1
);
  id_7(
      .id_0(id_2), .id_1(id_1), .id_2(id_3), .id_3(1), .id_4(id_1 > 1)
  );
  xnor primCall (id_0, id_2, id_1, id_7, id_4, id_3);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
