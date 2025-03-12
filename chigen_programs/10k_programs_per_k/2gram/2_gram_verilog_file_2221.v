// Seed: 1843455686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output reg id_1;
  always begin : LABEL_0
    id_1 = -1 & 1;
  end
  wire [1 : 1] id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_3
  );
  inout wire id_2;
  inout reg id_1;
  id_6 :
  assert property (@(negedge id_3) id_3 ^ 1 - -1)
  else if (1) id_1 <= "";
  else id_6 <= id_1++;
endmodule
