// Seed: 531105286
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_3 = 32'd67
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output reg id_10;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  input wire id_2;
  xor primCall (id_10, id_4, id_2, id_6, id_5);
  output wire id_1;
  for (id_11 = id_4[id_3]; -1 == id_4; id_10 = -1)
  always @(posedge id_2 == 1) begin : LABEL_0
    id_11 = 1;
  end
endmodule
