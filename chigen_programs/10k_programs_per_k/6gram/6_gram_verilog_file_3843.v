// Seed: 3219083497
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  module_2 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1
);
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  module_3 modCall_1 ();
endmodule
module module_3 #(
    parameter id_1 = 32'd63,
    parameter id_2 = 32'd97
);
  defparam id_1.id_2 = 1'b0;
  assign module_2.id_3 = 0;
endmodule
