// Seed: 3574008242
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd76,
    parameter id_4 = 32'd78
) (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  defparam id_3.id_4 = id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 (
    output tri1  id_0,
    output wand  id_1,
    input  uwire id_2,
    output wire  id_3
);
  wire id_5;
  supply0 id_6 = 1;
  supply0 id_7;
  tri id_8;
  assign id_8 = 'h0;
endmodule
module module_3 (
    output tri  id_0,
    input  tri1 id_1,
    input  wand id_2
);
  final $display(1, 1, 1, id_2);
  assign id_0 = id_2(1);
  module_2 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign id_0 = !id_2;
endmodule
