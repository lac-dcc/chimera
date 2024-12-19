// Seed: 1396623777
module module_0 ();
  initial $display(1, {id_1{1}});
  assign module_1.type_5 = 0;
endmodule
module module_1;
  supply1 id_1;
  assign id_1 = 1;
  tri id_2;
  wor id_3;
  assign id_3 = id_2;
  initial begin : LABEL_0
    if ({id_1, id_2})
      if (id_1) $display(1);
      else id_1 = 1;
  end
  assign id_2 = (1'b0);
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wire id_0,
    input  tri  id_1
);
  assign id_0 = id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
