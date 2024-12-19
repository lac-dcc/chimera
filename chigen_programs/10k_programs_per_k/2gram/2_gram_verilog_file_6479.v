// Seed: 2665404905
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_5 = id_4;
  assign id_5 = id_2;
  reg id_6;
  assign id_6 = id_2;
  wire id_7;
  for (id_8 = 1; id_5; id_8 = id_5) begin : LABEL_0
    always {1'b0, id_8} <= id_8;
  end
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_1
  );
  id_9 :
  assert property (@(posedge 1) 1)
  else;
endmodule
