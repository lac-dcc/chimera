// Seed: 1191249023
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_6 :
  assert property (@(posedge id_3) -1)
  else #(id_6) id_1 <= id_2;
endmodule
module module_1;
  wire id_1;
  bit  id_2;
  id_3 :
  assert property (@(negedge id_3) id_3) @(negedge id_3, negedge id_2) id_2 <= 1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
