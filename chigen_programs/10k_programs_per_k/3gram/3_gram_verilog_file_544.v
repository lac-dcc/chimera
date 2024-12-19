// Seed: 3931189774
module module_0;
  id_1(
      .id_0(id_2), .id_1(1), .id_2(id_2), .id_3(1), .id_4(id_2), .id_5(1), .id_6(1'd0), .id_7(id_2)
  );
  wire id_3;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1
);
  id_3 :
  assert property (@(posedge id_0 == 1) id_1)
  else $display;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  wire id_9;
  xnor primCall (id_1, id_2, id_4, id_6, id_7, id_8, id_9);
  assign id_1 = 1;
  module_0 modCall_1 ();
  wire id_10;
  assign id_8 = id_8;
  wire id_11;
endmodule
