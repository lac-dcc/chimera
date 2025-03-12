// Seed: 948726468
module module_0;
  logic [-1 : ""] id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd74
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  parameter id_5 = -1;
  parameter id_6 = 1;
  wire id_7;
  always @(posedge id_4) id_2[id_1 : $realtime] <= "";
  module_0 modCall_1 ();
  id_8 :
  assert property (@(posedge id_7) id_3 ? id_8 : id_6)
  else $unsigned(30);
  ;
  parameter id_9 = -1;
  always_ff @(posedge id_7++
  or -1)
  begin : LABEL_0
    fork
      id_2 += 1;
    join_none
  end
endmodule
