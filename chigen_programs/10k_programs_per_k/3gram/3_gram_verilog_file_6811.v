// Seed: 1662550273
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_3 = 0;
  bit id_9;
  id_10 :
  assert property (@(1'b0) 1)
  else begin : LABEL_0
    id_9 <= -1'b0;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  inout wire id_1;
  logic id_3 = 1 | id_1;
endmodule
