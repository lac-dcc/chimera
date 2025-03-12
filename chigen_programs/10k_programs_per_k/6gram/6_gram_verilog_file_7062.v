// Seed: 2914587314
module module_0 (
    input tri1 id_0,
    input tri0 id_1
);
  logic id_3;
  ;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    output tri0 id_4,
    input tri id_5,
    output wand id_6
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_3,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input wand id_0
);
  logic id_2;
  module_0 modCall_1 (
      id_0,
      id_0
  );
endmodule
module module_3 (
    output tri id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    output supply1 id_4,
    output tri1 id_5,
    input tri id_6
    , id_9,
    output wire id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_2
  );
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    id_9 = #id_11 id_2;
    $unsigned(5);
    ;
    assign id_5 = ~1;
    id_11 <= -1;
  end
endmodule
