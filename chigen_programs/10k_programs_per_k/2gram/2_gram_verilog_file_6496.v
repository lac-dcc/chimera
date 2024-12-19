// Seed: 3545144637
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
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1 + id_12;
  wire id_13;
  always begin : LABEL_0
    id_3 = 1;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input logic id_0
);
  initial id_2 <= id_0;
  supply0 id_3;
  supply0 id_4;
  assign id_2 = 1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_3,
      id_5,
      id_4,
      id_5,
      id_3,
      id_5
  );
  task id_6;
    input id_7;
    id_2 = 1;
  endtask
  assign id_7 = 1;
  assign id_2 = 1;
  assign id_4 = id_2 ? id_6 : 1'b0 ? id_3 : 1;
  wire id_8;
endmodule
