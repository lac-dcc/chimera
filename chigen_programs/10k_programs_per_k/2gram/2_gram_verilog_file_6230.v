// Seed: 3789899124
module module_0 (
    input wor   id_0,
    input uwire id_1
);
  always begin : LABEL_0
    id_3 <= 1'b0;
  end
  assign module_1.id_0 = 0;
  module_2 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri1 id_3
);
  assign id_3 = 1'b0;
  id_5(
      id_1, 1'b0, !id_1
  );
  module_0 modCall_1 (
      id_0,
      id_2
  );
endmodule
macromodule module_2 ();
  reg id_1;
  always id_1 <= 1;
  id_2 :
  assert property (@(posedge 1, posedge 1) 1 - id_1)
  else;
endmodule
