// Seed: 2657322971
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
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_16;
  wor  id_17 = 1;
  final $display(id_6);
  always @(posedge id_8 or posedge 1) begin : LABEL_0
    id_17 = id_6;
  end
  always @(posedge id_12) begin : LABEL_0
    deassign id_13.id_7;
  end
  wire id_18;
endmodule
module module_1 (
    input  supply0 id_0,
    output supply0 id_1,
    output uwire   id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_17 = 0;
endmodule
