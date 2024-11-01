// Seed: 3550355114
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  logic [7:0] id_11;
  assign id_11[1] = id_8;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
  module_0(
      id_7, id_1, id_10, id_10, id_5, id_10, id_7, id_10, id_10
  );
  always @(!{id_4[1'b0 : ~|(1&&1==1)], 1 != 1} or posedge id_2) id_2 = #1 id_6[1'b0==1];
endmodule
