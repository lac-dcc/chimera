// Seed: 1979546890
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  assign id_5 = 1;
  wire id_6, id_7;
  initial id_4 = 1'd0 == 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  xnor primCall (id_3, id_2, id_6, id_7);
  assign id_1 = 1'b0;
  assign id_4 = id_3[1];
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
