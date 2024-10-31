// Seed: 1379453800
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_12;
  wire module_0;
  id_13(
      .id_0(1'd0), .id_1((1)), .id_2(1'b0), .id_3(1)
  );
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
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_7 or ~id_7 & 1 | 1 | 1) id_2 = #1 id_4[1'b0 : (1)];
  nor (id_1, id_7, id_5);
  module_0(
      id_1, id_1, id_7, id_1, id_6, id_1, id_7, id_1, id_1, id_5, id_1
  );
endmodule
