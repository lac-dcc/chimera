// Seed: 2960668568
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1'b0 ? 1 : id_2 ? !id_2 & (id_1) : id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 ();
  assign id_1 = 1;
  always @(posedge 1'd0 or posedge id_1) #1;
endmodule
