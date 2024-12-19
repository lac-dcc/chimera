// Seed: 1863880101
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    output wand id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6
);
  assign id_3 = id_1;
endmodule
module module_1 (
    input wor  id_0,
    input tri0 id_1,
    inout tri1 id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = (id_0 & 1 ? id_0 : id_1 == 1 ? id_2 : 1 ? id_1 & 1 : {1{1}}) && 1 == 1'd0;
endmodule
