// Seed: 289046897
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input uwire id_3
);
  assign id_2 = (id_1);
  module_2 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3
  );
  wire id_5;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input tri id_2,
    input tri id_3,
    input uwire id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1
  );
endmodule
module module_2 (
    output wand id_0,
    input uwire id_1,
    output tri id_2,
    input supply1 id_3
    , id_5
);
  id_6 :
  assert property (@(id_1) id_1)
  else begin : LABEL_0
    $unsigned(90);
    ;
  end
endmodule
