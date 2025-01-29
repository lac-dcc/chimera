// Seed: 1314017012
module module_0;
  assign id_1 = 1 ? -1 : 1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always $display(id_2, id_1, id_2);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = id_5[-1];
  module_0 modCall_1 ();
  assign id_1 = -1;
  bufif1 primCall (id_1, id_4, id_5);
endmodule
