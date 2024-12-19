// Seed: 1635766285
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
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  supply1 id_10;
  assign (weak1, pull0) id_6 = 1;
  timeunit 1ps;
  always @(posedge id_8) begin : LABEL_0
    for (id_7 = id_7.id_8; 1; id_4 += id_10) begin : LABEL_0
      deassign id_5.id_6;
    end
  end
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
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_3,
      id_5,
      id_5,
      id_8,
      id_7,
      id_8
  );
  wire id_10;
  always repeat (1) id_1 <= 1'b0 == 1'b0;
endmodule
