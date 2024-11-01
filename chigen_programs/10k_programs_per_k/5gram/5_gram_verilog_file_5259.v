// Seed: 1743159670
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_4;
  wire id_5;
  logic [7:0] id_7 = id_4;
  assign id_7[1] = id_2;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  module_0(
      id_3, id_2, id_2
  );
  assign id_2 = 1;
  always @(posedge id_2++or posedge {id_2, 1, id_3} <= id_3) id_3 = id_3 < 1;
  wire id_4;
endmodule
