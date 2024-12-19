// Seed: 992743918
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output uwire id_5
);
  wire id_7;
  module_2 modCall_1 ();
  wire id_8;
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1,
    input  uwire id_2,
    input  wand  id_3
    , id_7,
    input  wire  id_4,
    output wor   id_5
);
  supply0 id_8 = id_4;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_4,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 ();
  id_1(
      .id_0(id_2), .id_1(1'd0)
  );
  always @(posedge 1) $display(1'b0, id_2++, 1, 1'b0);
endmodule
