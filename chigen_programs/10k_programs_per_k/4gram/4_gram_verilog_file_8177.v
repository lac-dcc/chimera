// Seed: 4171166399
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  xor primCall (id_6, id_2, id_3, id_5, id_1, id_4, id_7);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output tri1 id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  assign id_3 = id_4;
  assign id_5 = id_1[-1 :-1'b0] ? 1 : id_4 - id_1;
  parameter id_6 = 1;
  wire [1 : 1] id_7;
  assign id_3 = id_7 ? $realtime : -1;
endmodule
