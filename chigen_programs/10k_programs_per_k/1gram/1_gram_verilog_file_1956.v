// Seed: 966717597
module module_0 (
    id_1
);
  input wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  inout wire _id_4;
  module_0 modCall_1 (id_3);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_6[(  -1  ) : id_4];
  id_7 :
  assert property (@(posedge id_7) 1) begin : LABEL_0
    id_7 = 1;
    id_6 = 1;
  end
  logic id_8;
  wire  id_9;
  always id_6 = id_1;
endmodule
