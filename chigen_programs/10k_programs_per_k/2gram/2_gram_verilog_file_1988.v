// Seed: 4112314488
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_8 = 1;
  wire id_9;
  ;
  wire id_10;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input  wor   id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  uwire id_5
);
  uwire [1 'h0 : -1] id_7;
  xor primCall (id_1, id_5, id_7, id_4, id_2, id_3);
  assign id_0 = id_7;
  assign id_7 = 1 - 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign id_0 = id_2;
endmodule
