// Seed: 1754399965
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  ;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout logic [7:0] id_1;
  logic [7:0] id_3;
  wire id_4 = id_1[-1'b0];
  assign id_1 = id_4;
  tran #(-1) (-1, id_1, 1);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  wire id_5;
  assign id_3[-1] = -1;
endmodule
