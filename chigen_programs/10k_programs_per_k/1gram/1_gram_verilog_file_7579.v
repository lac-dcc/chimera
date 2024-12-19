// Seed: 1159459208
module module_0 ();
  always id_1 <= 'b0;
  id_2 :
  assert property (@(posedge id_2 ? id_2 : id_1) 1 & 1);
  assign id_1 = 1 - {id_2 <= 1'b0};
  always for (id_1 = 1; 1; id_2 = 1) @(posedge id_1) id_1 <= 1;
endmodule
module module_1 ();
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_7;
  reg id_8;
  assign id_4 = id_8;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_9;
  wire id_10;
  assign id_5 = id_8;
  wire id_11;
  always_comb begin : LABEL_0
    id_8 <= id_1;
  end
endmodule
