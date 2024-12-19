// Seed: 1082604567
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd62,
    parameter id_8 = 32'd70
) (
    output supply0 id_0
    , id_2
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  supply0 id_4;
  wire id_5;
  wire id_6;
  defparam id_7 = id_4, id_8 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always id_1 = 1'd0;
  bufif1 primCall (id_1, id_6, id_7);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3,
      id_6,
      id_6
  );
endmodule
