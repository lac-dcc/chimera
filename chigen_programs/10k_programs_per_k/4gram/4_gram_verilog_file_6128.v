// Seed: 92444494
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  pmos (id_2, 1, -1'b0);
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
  inout wire id_1;
  id_8 :
  assert property (@(posedge id_8#(.id_7(1)) [1-:id_7]) id_7)
  else $unsigned(5);
  ;
endmodule
