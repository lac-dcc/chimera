// Seed: 3653915584
program module_0 (
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
  inout tri0 id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = -1'd0;
endprogram
module module_1;
  logic id_1;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  output uwire id_4;
  output wire id_3;
  input wire id_2;
  output reg id_1;
  logic [-1 : id_5] id_6;
  ;
  id_7 :
  assert property (@(posedge id_6) 1 - id_2)
  else begin : LABEL_0
    id_1 = -1;
  end
  assign id_7 = -1'd0;
  final begin : LABEL_1
    $signed(63);
    ;
  end
  wire [-1 : id_5] id_8;
  assign id_4 = -1;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_8,
      id_6,
      id_7,
      id_7,
      id_2
  );
endmodule
