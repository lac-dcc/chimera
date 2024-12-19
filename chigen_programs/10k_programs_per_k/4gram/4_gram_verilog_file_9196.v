// Seed: 2243437208
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  module_3 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign module_2.id_2  = 0;
endmodule
module module_1 ();
  id_1(
      .id_0(id_2)
  );
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2;
  wire id_2;
  wire id_3;
  assign id_1 = (id_3);
  assign id_2 = (1);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_3 #(
    parameter id_1 = 32'd73,
    parameter id_2 = 32'd76
);
  defparam id_1.id_2 = id_1;
endmodule
