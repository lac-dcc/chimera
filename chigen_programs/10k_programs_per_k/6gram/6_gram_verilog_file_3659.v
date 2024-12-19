// Seed: 3747293094
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
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_16;
  reg id_17;
  wor id_18 = id_16[1] == 1, id_19;
  wor id_20;
  always @(id_10 - 1) begin : LABEL_0
    if (id_20 == ~&id_4) begin : LABEL_0
      id_13 <= id_11;
      if (id_11 && (1 & id_4) == 1)
        #1 begin : LABEL_0
          id_17 <= 1;
        end
    end
  end
  wire id_21;
  assign id_8 = (id_7 - id_5) == id_10;
  wire id_22;
  assign module_1.type_0 = 0;
  assign id_1 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  tri1  id_3,
    output tri0  id_4,
    input  logic id_5,
    output wor   id_6,
    input  tri0  id_7,
    input  wor   id_8,
    input  tri   id_9,
    output tri0  id_10,
    output logic id_11
);
  wire id_13;
  tri  id_14 = 1;
  reg  id_15;
  assign id_11 = id_5;
  always @(1) begin : LABEL_0
    begin : LABEL_0
      id_15 = #1 1;
    end
    id_11 <= 1;
  end
  module_0 modCall_1 (
      id_14,
      id_13,
      id_13,
      id_14,
      id_13,
      id_14,
      id_14,
      id_13,
      id_14,
      id_13,
      id_15,
      id_13,
      id_15,
      id_13,
      id_13
  );
endmodule
