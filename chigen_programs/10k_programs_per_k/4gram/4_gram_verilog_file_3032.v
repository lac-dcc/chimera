// Seed: 3713567537
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output tri0 id_3
    , id_10,
    input uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input supply0 id_7,
    output wire id_8
);
  logic [1 : -1] module_0;
endmodule
module module_1 (
    output wire id_0,
    output wor  id_1,
    output wor  id_2,
    input  tri  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2;
  static logic id_1;
endmodule
module module_3 #(
    parameter id_8 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire _id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  module_2 modCall_1 ();
  output logic [7:0] id_4;
  output uwire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4[id_8 : id_8] = id_7;
  assign id_3 = id_6[1] & -1;
  id_11 :
  assert property (@(posedge 1) -1)
  else $unsigned(29);
  ;
endmodule
