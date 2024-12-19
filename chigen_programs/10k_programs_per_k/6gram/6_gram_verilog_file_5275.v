// Seed: 2240245196
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_8(
      id_5, id_2, id_5, id_7 == 1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_4;
  assign id_4[1] = id_1;
  assign id_4[1] = id_2;
  wire id_5, id_6, id_7, id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2,
      id_7,
      id_5,
      id_6
  );
  assign id_1[1'b0] = 1;
endmodule
