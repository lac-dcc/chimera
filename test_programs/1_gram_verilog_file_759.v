// Seed: 4220060692
module module_0;
  initial id_1 <= -1 * id_1;
  wire id_5, id_6;
  module_2 modCall_1 (
      id_6,
      id_1
  );
endmodule
module module_1 #(
    parameter id_4 = 32'd13
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  final assign id_4[id_4] = id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  id_3 :
  assert property (@(posedge id_1 or id_3 or 1, -1) 1) id_2 <= -1;
  assign module_0.id_3 = 0;
endmodule
