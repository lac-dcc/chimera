// Seed: 2811000748
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4 = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  wire id_5;
  assign id_4 = id_2;
endmodule
module module_2 (
    input wor  id_0,
    input wire id_1,
    input wire id_2
);
  id_4 :
  assert property (@(posedge 1) 1)
  else $display(id_0, 1, 1 == 1, id_1, 1);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
