// Seed: 3623328076
module module_0 (
    output wor   id_0,
    input  wor   id_1,
    input  uwire id_2,
    output wand  id_3
);
  supply1 id_5;
  assign id_3 = (id_5);
endmodule
module module_1 (
    input  tri  id_0,
    output tri1 id_1,
    output tri0 id_2
);
  assign id_1 = 1;
  module_0(
      id_2, id_0, id_0, id_1
  );
endmodule
module module_2 (
    output logic id_0,
    input  uwire id_1,
    output wire  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    input  uwire id_5,
    output wor   id_6
);
  always @(posedge 1)
    if (1 && id_3 == id_4) id_0 <= $display();
    else $display("", 1);
  module_0(
      id_6, id_5, id_5, id_2
  );
endmodule
