// Seed: 72175745
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  always @(posedge id_2 or posedge 1'b0);
  wire id_8;
  assign module_1.id_3 = 0;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    output wor   id_2,
    output wor   id_3,
    input  uwire id_4,
    output uwire id_5
);
  uwire id_7, id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7
  );
  id_9 :
  assert property (@(posedge 1) id_8)
  else begin : LABEL_0
    id_1 <= id_0;
  end
endmodule
