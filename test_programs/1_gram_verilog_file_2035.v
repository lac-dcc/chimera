// Seed: 160124653
module module_0;
  assign id_1[1'h0] = 1;
  module_2 modCall_1 ();
  wire id_2, id_3;
endmodule
module module_1;
  integer id_1;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  assign id_1 = 1;
  assign id_2 = 1;
  always $display(1'd0);
  wire id_3;
  wire id_4;
endmodule
module module_3 (
    input wand id_0,
    output supply0 id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input wor id_5
);
  final id_1 = -1;
  assign module_4.id_0 = 0;
  for (id_7 = id_4; -1'b0; id_1 = id_2) assign id_1 = id_3;
endmodule
program module_4 (
    input wand id_0,
    inout wand id_1,
    input tri0 id_2,
    input wor  id_3
);
  assign id_1 = id_1;
  genvar id_5;
  module_3 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_1
  );
  genvar id_6;
  id_7(
      .id_0({id_1(id_5) && 1, id_2, -1'b0, id_2 !== -1'b0}), .id_1(id_5), .id_2(1'b0 | id_0 * -1)
  );
endmodule
