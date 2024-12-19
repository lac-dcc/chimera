// Seed: 2494473480
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd4,
    parameter id_6 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_5.id_6 = id_1;
  nor primCall (id_2, id_5, id_1, id_7);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
