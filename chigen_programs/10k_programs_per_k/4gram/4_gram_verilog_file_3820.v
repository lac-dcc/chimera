// Seed: 441246773
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  assign module_1.id_15 = 0;
  inout wire id_1;
  logic id_3 = 1'b0;
endmodule
module module_1 (
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_4
  );
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    $signed(8);
    ;
  end
  id_15 :
  assert property (@(negedge -1) 1)
  else $clog2(42);
  ;
  logic id_16;
  ;
  assign id_12 = (id_1);
endmodule
