// Seed: 4209645526
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  not primCall (id_2, id_5);
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4
  );
  assign id_2 = (1'b0);
  wire id_5;
  assign id_4 = 1;
endmodule
module module_2;
  always @(id_1) id_1 <= #1 1'd0;
endmodule
