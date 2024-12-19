// Seed: 2557878031
module module_0;
  id_1 :
  assert property (@(1) !(id_1 !== id_1))
  else begin : LABEL_0
    id_1 <= #1 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  assign id_1 = id_3;
  assign id_6 = 1 && id_4++;
  always_ff @(posedge id_5) id_4 <= id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
