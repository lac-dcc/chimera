// Seed: 907911795
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2
);
  assign id_2 = id_1;
  reg id_4;
  initial id_4 <= -1;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    output wor id_4,
    output uwire id_5,
    output wor id_6,
    input tri id_7,
    input uwire id_8
);
  logic id_10;
  ;
  nor primCall (id_3, id_12, id_2, id_10, id_11, id_1);
  wire  id_11;
  logic id_12;
  ;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
