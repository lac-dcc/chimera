// Seed: 1925087011
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_8 :
  assert property (@(posedge 1) id_1 ^ 1'b0)
  else $display(id_6);
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  supply0 id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign id_3 = 1 !== id_1;
endmodule
