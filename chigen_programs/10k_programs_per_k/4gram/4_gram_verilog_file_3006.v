// Seed: 1468889662
module module_0 #(
    parameter id_6 = 32'd75,
    parameter id_7 = 32'd88
) (
    output tri0  id_0,
    output wire  id_1,
    output tri0  id_2,
    input  tri1  id_3,
    input  uwire id_4
);
  module_2 modCall_1 ();
  assign module_1.id_4 = 0;
  defparam id_6.id_7 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    output tri   id_3,
    input  wire  id_4
);
  wire id_6;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 ();
  wire id_1;
  assign module_0.id_4 = 0;
endmodule
