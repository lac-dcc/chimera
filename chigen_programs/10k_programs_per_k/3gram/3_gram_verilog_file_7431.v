// Seed: 2571429818
macromodule module_0 ();
  tri id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial
  fork
    id_1 <= id_2;
    if (id_2) force id_1 = id_1 ^ id_4 >= id_3;
    else begin
      id_3 <= (id_3 < ~1);
    end
  join
  module_0();
endmodule
module module_2 (
    output tri0 id_0,
    output tri0 id_1,
    output wand id_2
);
  assign id_1 = 1;
  module_0();
endmodule
