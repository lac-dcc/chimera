// Seed: 3420263794
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_6 = id_2;
  module_0(
      id_3, id_1, id_3, id_2
  ); id_7 :
  assert property (@(posedge id_7) 1 ? id_6 : 1)
  else $display;
  assign id_2 = {id_2{id_4++}};
endmodule
