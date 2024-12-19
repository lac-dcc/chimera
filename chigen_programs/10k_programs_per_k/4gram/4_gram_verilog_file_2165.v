// Seed: 2013136848
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  always @(negedge 1'd0) id_3 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_6;
  genvar id_7;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_7
  );
  and primCall (id_5, id_1, id_4, id_2);
endmodule
