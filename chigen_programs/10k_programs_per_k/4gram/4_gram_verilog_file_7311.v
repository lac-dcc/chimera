// Seed: 2297399108
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri1 id_5
);
  assign id_7 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input uwire id_2,
    output wand id_3,
    input tri id_4,
    input tri1 id_5,
    output wand id_6,
    input tri1 id_7,
    output tri0 id_8,
    input supply1 id_9
);
  assign id_0 = id_7 ? 1 : {1, {1, 1}};
  assign id_8 = id_9;
  module_0(
      id_2, id_2, id_5, id_9, id_5, id_9
  );
  assign id_0 = 1'b0;
endmodule
