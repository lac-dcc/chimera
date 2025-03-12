// Seed: 1391819639
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  output reg id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  assign module_1.id_3 = 0;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output reg id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_14 <= {-1, id_12 & id_4 == id_9};
    if (1) begin : LABEL_1
      id_5 <= #1 1;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout reg id_3;
  output reg id_2;
  input wire id_1;
  always begin : LABEL_0
    if (-1 || 1) id_3 = 1;
  end
  assign id_2 = ({{1{1}} - -1, -1} + {id_3{(1)}});
  always_latch begin : LABEL_1
    id_2 = id_3;
    wait (id_3);
    logic \id_4 ;
    ;
    id_3  <= id_1;
    \id_4 <= -1;
  end
  id_5 :
  assert property (@(posedge id_1 or posedge 1) 1'b0 < id_1)
  else;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_3,
      id_5,
      id_1
  );
endmodule
