// Seed: 1828164600
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3
  );
  output reg id_1;
  always @(posedge !id_3);
  id_4 :
  assert property (@(id_2) 1 - 1)
  else if (1) begin : LABEL_0
    id_1 <= id_4;
  end
  buf primCall (id_3, id_2);
endmodule
