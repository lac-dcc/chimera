// Seed: 3544820518
module module_0 ();
  tri id_1, id_2 = 1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    input wand id_2,
    output tri id_3,
    input wor id_4,
    input wand id_5
);
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    input tri0 id_0
);
  assign id_2 = -1;
  assign id_3 = id_0;
  module_0 modCall_1 ();
endmodule
module module_3 (
    input uwire id_0,
    input supply1 id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4
);
  assign id_2 = id_4 - id_1;
  tri id_6;
  or primCall (id_2, id_3, id_4, id_6, id_7, id_8, id_9);
  function id_7;
    output id_8;
    reg id_9, id_10;
    force {{id_6}, {id_10, id_7, -1}, -1'b0, id_1, id_4, -1'd0, id_3, 1'b0} = id_7;
  endfunction
  assign id_8 = id_10;
  parameter id_11 = 1 || id_8;
  assign id_6 = id_3;
  tri1 id_12 = -1;
  module_0 modCall_1 ();
endmodule
