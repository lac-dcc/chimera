// Seed: 4243293586
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_3 or posedge id_2, negedge {id_2{id_3}}) id_3 = 1;
  module_2();
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  module_0(
      id_3, id_3, id_1, id_1, id_3, id_1
  );
endmodule
module module_2;
  id_1 :
  assert property (@(posedge 1 * 1) id_1) $display(id_1, 1);
  wire id_2;
  id_4(
      id_3
  );
  wire id_5;
  assign id_4 = 1;
  assign id_2 = id_2;
endmodule
