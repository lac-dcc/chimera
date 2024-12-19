// Seed: 326946275
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  task id_9;
    id_5 = 1;
  endtask
  wire id_10;
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
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  assign id_4 = 1 - 1;
  wor id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_8,
      id_10,
      id_12,
      id_4,
      id_7
  );
  always_ff @(posedge id_4 or posedge 1'b0) id_4 = id_12;
  final $display(id_3++, id_11);
endmodule
