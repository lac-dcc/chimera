// Seed: 694687371
module module_0 (
    output wire id_0,
    input wand id_1,
    input tri id_2,
    input wand id_3,
    output supply1 id_4,
    input wand id_5,
    input tri id_6,
    output tri1 id_7
);
  wire id_9;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input uwire id_2,
    output wand id_3,
    output supply1 id_4,
    input tri0 id_5
);
  logic [7:0] id_7;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_3,
      id_0,
      id_1,
      id_4
  );
  assign id_4 = id_7[!1] == id_1;
endmodule
