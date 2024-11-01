// Seed: 2950034715
module module_0 (
    output tri0 id_0,
    output wor  id_1
);
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  uwire id_4,
    output tri0  id_5,
    output tri1  id_6
);
  always begin
    id_6 = id_1;
  end
  wire id_8;
  module_0(
      id_6, id_5
  );
endmodule
module module_2 (
    input  tri0 id_0,
    output wire id_1,
    input  wand id_2
);
  always @(negedge 1'b0) $display(id_2 + id_2);
  assign id_1 = 1 ? 1 : id_2 ? 1 : id_2;
  module_0(
      id_1, id_1
  );
  wire id_4 = id_2;
endmodule
