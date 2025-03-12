// Seed: 2759307951
module module_0 (
    input wand id_0,
    output tri id_1,
    output tri1 id_2,
    input supply1 id_3
);
  assign id_2 = 1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    output tri id_0,
    input  tri id_1
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output logic id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wor   id_3
);
  initial begin : LABEL_0
    id_0 <= id_1;
    begin : LABEL_1
      if (1) begin : LABEL_2
        id_0 = -1;
        $signed(81);
        ;
      end
    end
  end
  assign id_0 = id_3 == 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3
  );
  parameter id_5 = -1;
endmodule
