// Seed: 3648752076
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input tri0 id_3,
    output wor id_4
);
  assign id_4 = 1 ^ id_0;
  assign id_1 = $display(1 / "", id_0, 1'h0, 1);
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input wor id_4,
    output wor id_5
);
  assign id_5 = id_2 ? 1 : id_1 ? id_0 : 1;
  assign id_5 = id_3;
  module_0(
      id_2, id_5, id_2, id_1, id_5
  );
  wire id_7;
  assign id_5 = id_4;
endmodule
