// Seed: 1529689945
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output wor id_2,
    input tri1 id_3,
    output wor id_4,
    output tri0 id_5,
    output uwire id_6,
    output tri id_7
);
  assign id_5 = id_0;
  wire id_9;
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    output supply0 id_2,
    output tri id_3,
    output tri id_4,
    inout supply1 id_5,
    input uwire id_6,
    output wor id_7,
    output wor id_8,
    input uwire id_9,
    output uwire id_10
);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_7,
      id_1,
      id_10,
      id_8
  );
  assign modCall_1.id_6 = 0;
  assign id_4 = {id_9, id_6};
  logic id_12;
  assign id_8 = id_0;
  assign id_7 = id_0;
endmodule
