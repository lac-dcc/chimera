// Seed: 2420058884
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_5 = 0;
  logic id_8, id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[-1'h0<<1] = id_3 ? id_4 : 1;
  xor primCall (id_1, id_3, id_4, id_2, id_5);
  logic id_5;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5
  );
endmodule
