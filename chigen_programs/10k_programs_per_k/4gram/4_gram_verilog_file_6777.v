// Seed: 926748272
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri id_3,
    input wire id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    inout wor id_11,
    output uwire id_12,
    output wor id_13,
    input tri id_14,
    input tri id_15,
    output supply0 id_16,
    input uwire id_17,
    input tri1 id_18,
    input tri0 id_19,
    input tri0 id_20,
    input supply1 id_21,
    output tri0 id_22,
    input tri0 id_23,
    input wand id_24,
    input wand id_25,
    input tri0 id_26,
    input wire id_27,
    input supply0 id_28,
    input uwire id_29,
    output uwire id_30,
    input wire id_31
);
  final $display(1'd0, 1, 1);
  assign module_1.id_19 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    inout tri id_2,
    output logic id_3,
    input logic id_4,
    input wand id_5,
    output wire id_6,
    input wor id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    input logic id_11,
    output uwire id_12,
    input supply0 id_13,
    output tri id_14,
    input tri id_15,
    output logic id_16,
    input wor id_17,
    input supply0 id_18,
    input supply1 id_19,
    input wand id_20,
    output supply1 id_21
);
  wire id_23;
  always @(*) begin : LABEL_0
    id_16 <= id_11;
    id_16 <= id_4;
  end
  module_0 modCall_1 (
      id_20,
      id_6,
      id_19,
      id_10,
      id_2,
      id_2,
      id_14,
      id_19,
      id_19,
      id_9,
      id_7,
      id_2,
      id_6,
      id_14,
      id_7,
      id_17,
      id_12,
      id_18,
      id_10,
      id_1,
      id_7,
      id_17,
      id_6,
      id_1,
      id_8,
      id_17,
      id_8,
      id_8,
      id_20,
      id_20,
      id_21,
      id_2
  );
  always @(1 or posedge 1) begin : LABEL_0
    id_3 <= id_5 || id_1;
    id_0 = 1;
    $display;
  end
  always
  fork
  join : SymbolIdentifier
  wire id_24;
  assign id_14 = 1;
endmodule
