// Seed: 3702390132
module module_0;
  id_1(
      .id_0(id_2)
  );
  wire id_3;
  assign id_3 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wor id_2,
    input uwire id_3,
    input tri id_4,
    input tri1 id_5
);
  timeunit 1ps;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wor id_0,
    output wire id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4
);
  assign id_0 = id_3 - id_4 ? 1 : 1;
  timeunit 1ps / 1ps;
  nand primCall (id_0, id_2, id_3, id_4);
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
