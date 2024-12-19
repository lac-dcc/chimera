// Seed: 924867784
module module_0;
  id_2(
      1, id_1, id_1
  );
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_4 = 1 ? id_1 : 1'd0;
  and primCall (id_1, id_2, id_3, id_4);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  supply1 id_1 = 1;
endmodule
module module_3 ();
  wire id_2;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_4 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  always #1 $display(1 <= id_2);
  module_2 modCall_1 ();
  assign modCall_1.type_2 = 0;
endmodule
