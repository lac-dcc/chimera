// Seed: 1599648831
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_6, id_7;
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
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_1
  );
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_4) #1;
endmodule
