// Seed: 1542725534
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_7 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    input tri id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd3,
    parameter id_5 = 32'd16,
    parameter id_6 = 32'd92
) ();
  uwire id_2;
  wire  id_3;
  assign id_2 = -1;
  defparam id_4 = 1, id_5 = 1, id_6 = id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3
  );
  assign id_3 = id_1;
endmodule
