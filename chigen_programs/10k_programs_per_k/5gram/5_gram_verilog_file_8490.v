// Seed: 2136191167
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input uwire id_5
);
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  assign module_2.id_0 = 0;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output supply0 id_2,
    input wor id_3,
    output wor id_4,
    output supply0 id_5,
    input wor id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_6,
      id_0,
      id_4,
      id_6
  );
endmodule
module module_2 (
    output wire id_0,
    input tri1 id_1,
    output supply0 id_2,
    output tri1 id_3
);
  initial assume (1 == {id_1{1}});
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
endmodule
