// Seed: 3674431704
module module_0;
  uwire id_1, id_2;
  initial $display;
  assign module_3.id_1 = "";
  always
    if (1 ? 1 : id_2) id_3 = 1'b0;
    else id_3 = 1;
endmodule
module module_1 (
    output uwire id_0
);
  wire id_3;
  module_0 modCall_1 ();
endmodule
module module_2;
  assign id_1 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  reg id_2;
  assign id_1 = id_2;
  id_3(
      ""
  );
  always id_1 <= 1;
endmodule
module module_3 (
    id_1
);
  inout wire id_1;
  assign id_1 = "";
  if (1) assign #1 id_1 = id_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
