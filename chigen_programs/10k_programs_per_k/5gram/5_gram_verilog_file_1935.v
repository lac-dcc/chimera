// Seed: 369987009
module module_0 ();
  specify
    (id_1 => id_2) = 1;
    if (1 && 1'b0) (negedge id_3 => (id_4 +: id_1)) = ((1 === id_4) & 1, 1'b0);
    (id_5 => id_6) = (1, 1 - id_3);
  endspecify
  assign module_1.id_1 = 0;
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply1 module_2
);
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
