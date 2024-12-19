// Seed: 2154248086
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4
);
  module_2 modCall_1 ();
  assign modCall_1.id_1  = 0;
  assign module_1.type_0 = 0;
  and primCall (id_1, id_2, id_3, id_4);
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    input  uwire id_2,
    output wor   id_3
);
  wire id_5;
  wor  id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_6,
      id_0
  );
  always #id_7
    if (id_6) begin : LABEL_0
      id_6 = id_0;
      $display(1'h0);
    end
endmodule
module module_2;
  tri id_2;
  id_3(
      .id_0(1), .id_1(1 | id_1), .id_2(1'b0), .id_3(1'b0)
  );
  assign id_2 = id_1;
  wire id_4;
endmodule
