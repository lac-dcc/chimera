// Seed: 1326705373
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11;
  ;
  wire id_12;
endmodule
module module_1 (
    output wire  id_0,
    output uwire id_1,
    output uwire id_2
);
  parameter id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  logic [7:0] id_5;
  ;
  specify
    if (-1) (posedge id_6 => (id_7 +: -1)) = (id_5[-1], id_6);
    (id_8 => id_9) = (-1  : id_6  : id_7, {1, 1, id_6#(.id_4(1))});
  endspecify
endmodule
