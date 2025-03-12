// Seed: 633956002
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = (id_2);
endmodule
module module_1 #(
    parameter id_9 = 32'd42
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wor id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_1,
      id_6
  );
  assign {id_4, id_4} = -1;
  logic id_8;
  localparam id_9 = 1;
  assign id_6 = -1 ^ id_6;
  id_10 :
  assert property (@(posedge id_4[1&&id_9 :-1]) 1)
  else begin : LABEL_0
    id_10 <= id_9 < 1;
  end
endmodule
