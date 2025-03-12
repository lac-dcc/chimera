// Seed: 2870229881
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
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_2;
  wire id_17;
  assign module_1.id_17 = 0;
  wire id_18;
  id_19 :
  assert property (@(posedge -1 - 1) -1)
  else $clog2(4);
  ;
  integer id_20;
  ;
endmodule
module module_0 (
    output logic id_0,
    input wire id_1,
    input wor id_2,
    input wor id_3,
    input supply0 id_4,
    output tri1 module_1,
    input tri1 id_6,
    input logic id_7,
    input tri id_8,
    input tri0 id_9,
    input wor id_10,
    output tri id_11,
    input tri id_12,
    output logic id_13,
    output wand id_14
);
  assign id_13.id_7 = -1'h0;
  if (1) begin : LABEL_0
    assign id_13 = id_1;
  end else logic id_16;
  ;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
  always_ff @(posedge 1) begin : LABEL_1
    assume (id_4);
    assume #1  (id_0++) $unsigned(27);
    ;
    forever begin : LABEL_2
      id_0  = (id_4 - 1);
      id_13 = id_8 || id_7;
    end
    @(posedge id_2);
    fork
      id_17;
    join
  end
  wire id_18;
  logic [7:0] id_19;
  assign id_19[-1] = 1;
endmodule
