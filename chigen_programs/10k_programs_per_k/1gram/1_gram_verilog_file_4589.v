// Seed: 4280210498
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd10
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_4 = id_2;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  wor  id_7;
  wire id_8;
  initial $display(id_7, 1, 1);
endmodule
