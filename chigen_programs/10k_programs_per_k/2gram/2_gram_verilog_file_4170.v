// Seed: 3771673946
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    output uwire id_3
);
  assign module_2.type_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output wor id_2,
    output uwire id_3
);
  assign id_2 = 1;
  wire id_5;
  xnor primCall (id_2, id_0, id_5, id_6, id_7);
  wire id_6;
  id_7(
      .id_0(1'b0)
  );
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  tri0  id_0,
    input  tri   id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri   id_4,
    output uwire id_5,
    output logic id_6,
    output uwire id_7
);
  assign id_5 = id_4;
  always begin : LABEL_0
    #id_9 id_6 = #id_10 id_9;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_5
  );
  assign id_6 = 1;
endmodule
