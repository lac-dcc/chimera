// Seed: 3772614020
module module_0 ();
  assign id_1 = id_1;
  assign id_2 = -1;
  assign module_2.id_9 = 0;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  initial id_2 <= id_7[1'b0 :-1][(1+1)];
  assign id_2 = id_8;
  uwire id_9 = 1;
  assign id_6 = id_5;
  module_0 modCall_1 ();
  rnmos (.id_0(id_1), .id_1(1), .id_2(1));
  id_10 :
  assert property (@(posedge -1) "" - 1) id_5 <= ~id_4;
  id_11(
      id_9, id_10
  );
endmodule
