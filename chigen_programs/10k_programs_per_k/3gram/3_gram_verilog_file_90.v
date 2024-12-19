// Seed: 3616531521
module module_0 (
    output tri1 id_0,
    output supply1 id_1
);
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input tri0 id_5
);
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13;
  wire id_14;
  assign id_7 = 1;
endmodule
module module_3;
  supply1 id_2;
  assign id_2 = 1;
  `define pp_3 0
  id_4 :
  assert property (@(negedge `pp_3) 1'd0)
  else `pp_3 <= 1'h0;
  module_2 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_1 = 1;
  assign id_4 = 1;
endmodule
