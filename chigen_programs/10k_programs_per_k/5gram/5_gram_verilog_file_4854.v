// Seed: 2088211191
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3
  );
  id_4 :
  assert property (@(posedge 1 | 1) id_2 == 1'b0)
  else $display;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign id_1 = 1;
endmodule
