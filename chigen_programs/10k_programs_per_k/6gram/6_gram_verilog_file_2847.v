// Seed: 3958715394
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd19,
    parameter id_8 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6 = id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2
  );
  assign id_3 = 1 ? 1 : id_5;
  defparam id_7.id_8 = 1'b0;
endmodule
