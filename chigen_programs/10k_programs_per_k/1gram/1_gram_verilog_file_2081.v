// Seed: 1194650512
module module_0 (
    id_1
);
  input wire id_1;
  assign id_2 = 1;
  module_2 modCall_1 (id_2);
endmodule
module module_1;
  assign id_1 = 1'h0;
  wire id_3, id_5, id_6;
  module_0 modCall_1 (id_5);
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  assign module_0.id_2 = 0;
  id_2 :
  assert property (@(negedge id_2 or posedge 1) id_1) id_2 = id_1;
endmodule
module module_3 (
    output uwire id_0
);
  tri1 id_2;
  assign id_0 = 1 + ~id_2;
  supply0 id_3, id_4, id_5;
  module_2 modCall_1 (id_4);
  assign modCall_1.id_1 = 0;
  assign id_5 = 1;
endmodule
