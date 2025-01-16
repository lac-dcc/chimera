// Seed: 3246878279
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    output supply0 id_2
);
  module_2 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.type_1 = 0;
  always begin : LABEL_0$display
    ;
    #1 begin : LABEL_0
      id_2 = id_1;
    end
  end
  wire id_4;
  assign module_1.id_4 = 0;
  wire id_5, id_6;
endmodule
macromodule module_1 (
    input  tri id_0,
    output tri id_1,
    output wor id_2
);
  assign id_1 = -1 || 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1
  );
  reg id_4, id_5;
  wire id_6;
  initial id_5 <= (id_5 - -1);
endmodule
module module_2 (
    input tri id_0,
    id_3 = 1,
    input wor id_1
);
  parameter id_4 = 1;
  parameter id_5 = !-1;
endmodule
