// Seed: 2159522485
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout uwire id_9;
  output wire id_8;
  inout tri0 id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_7 = 1;
  logic [1 : 1] id_10 = id_2;
  assign id_9 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output reg id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  output wire id_1;
  initial begin : LABEL_0
    id_2 <= 1;
    fork
      id_4;
      $signed(0);
      ;
    join
  end
endmodule
