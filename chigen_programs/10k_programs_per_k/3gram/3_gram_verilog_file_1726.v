// Seed: 3467004848
module module_0 (
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
  always_comb @(posedge !(1)) id_1 = id_3;
  assign id_2#(.id_6(1)) = 1'b0;
  assign id_2 = id_6;
  always @(id_7 == id_7 or negedge id_6) disable id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = id_2 == 1;
  nand primCall (id_3, id_2, id_5);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_2,
      id_1
  );
endmodule
