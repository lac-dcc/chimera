// Seed: 165882587
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    input wor id_4
);
  wire id_6;
  assign module_2.type_1 = 0;
  assign module_1.id_0   = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    output supply1 id_3
);
  assign id_0 = 1;
  not primCall (id_2, id_1);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_1
  );
endmodule
module module_2 (
    input wand id_0,
    output supply1 id_1
);
  assign id_1 = 1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign id_1 = 1'b0;
  assign id_1 = 1 ? id_0 : id_0 ? 1'b0 : 'b0;
endmodule
