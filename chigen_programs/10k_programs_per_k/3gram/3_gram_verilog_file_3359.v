// Seed: 2546150946
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
  output logic [7:0] id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  assign module_1.id_2 = 0;
  inout wire id_1;
  for (id_8 = id_8; id_8; id_6[-1] = id_5) begin : LABEL_0
    wire id_9;
    assign id_9 = id_8[1];
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output logic [7:0] id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  input wire id_1;
  and primCall (id_5, id_7, id_3, id_1);
  assign id_4 = (id_3);
  assign id_4[id_2] = 1;
  reg id_6 = (1'b0);
  id_7 :
  assert property (@(-1) id_3[(-1) : (1)])
  else if (1) if (-1) id_6 <= -1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_5,
      id_7,
      id_1,
      id_4,
      id_5
  );
endmodule
