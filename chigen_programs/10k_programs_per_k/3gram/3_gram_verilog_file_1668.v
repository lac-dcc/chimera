// Seed: 1392921523
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
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  assign id_2 = id_12;
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
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1 or posedge id_5.id_1)
    id_4 <= id_5 ? id_5 : 1 ? id_5 : 1 ? 1 : id_2 ? &1'b0 : {1{1}} ? 1 : id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2
  );
  assign {{id_5, 1, id_5, id_5}, 1 & id_5} = 1;
endmodule
