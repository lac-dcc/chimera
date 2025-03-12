// Seed: 3511808921
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input logic [7:0] id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_2
  );
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge id_6 - id_1, id_1) begin : LABEL_0
    wait (id_6[-1]);
    wait (id_3);
  end
endmodule
