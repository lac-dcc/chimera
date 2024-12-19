// Seed: 3132419957
module module_0;
  always_comb #0 id_1 <= 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  final $display(id_3);
  final begin : LABEL_0$display
    ;
  end
  wire id_7;
  assign id_3[1] = id_4;
  xnor primCall (id_3, id_4, id_5, id_6, id_7, id_8);
  wire id_8;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri  id_0,
    input tri0 id_1
);
  assign id_3 = id_0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
