// Seed: 1029925574
module module_0 (
    output uwire id_0,
    input  uwire id_1
);
  parameter id_3 = -1;
  module_2 modCall_1 ();
  always begin : LABEL_0
    begin : LABEL_0
      id_0 = id_3;
    end
  end
  assign id_0 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output wor id_2,
    output wand id_3
);
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
  always_latch id_2 = "" && 1;
endmodule
module module_2;
  assign module_3.type_6 = 0;
  assign id_1 = id_1;
  assign module_0.id_1 = 0;
endmodule
module module_3 (
    output wand id_0,
    output supply1 id_1,
    output wand id_2,
    input supply0 id_3
);
  assign id_2 = -1'b0 * id_3;
  wire id_5;
  module_2 modCall_1 ();
endmodule
