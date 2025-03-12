// Seed: 3847618252
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input tri0 id_2,
    output tri0 id_3,
    output supply0 id_4,
    output supply1 id_5
);
  assign id_3 = id_0;
  assign module_2.id_4 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wand id_2,
    input supply0 id_3
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0
  );
endmodule
module module_2 (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    input tri id_3,
    output supply0 id_4
);
  pullup ("", 'b0);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2
  );
endmodule
