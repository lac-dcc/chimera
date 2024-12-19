// Seed: 2488076206
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2,
      id_1
  );
endmodule
module module_2;
  id_1 :
  assert property (@(posedge id_1) id_1)
  else $display(id_1, id_1 - 1, id_1 == 1);
endmodule
