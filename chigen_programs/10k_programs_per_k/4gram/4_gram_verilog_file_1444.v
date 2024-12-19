// Seed: 1151246264
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_7 = 32'd32,
    parameter id_8 = 32'd51
) (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  tri   id_3;
  wire  id_4;
  uwire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  wire id_6;
  assign id_3 = !id_5;
  defparam id_7.id_8 = id_8;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  xnor primCall (id_4, id_2, id_3, id_8, id_5, id_6);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9
  );
endmodule
