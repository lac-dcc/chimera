// Seed: 2961596292
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_4;
  xor (id_3, id_4, id_2, id_1);
  assign id_3 = id_4;
  module_0(
      id_2, id_1, id_2, id_2, id_2
  );
  assign id_2 = 1'b0 | 1 | id_1;
  always @(posedge id_3) id_4 = #1 id_3;
endmodule
