// Seed: 3583380123
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  assign module_2.type_12 = 0;
  wire id_8;
  assign id_2 = id_4;
endmodule
module module_1;
  wand id_2 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_1 = 1'd0;
  wire id_3;
  assign id_2 = 1;
endmodule
module module_2 (
    input tri1 id_0,
    input uwire id_1,
    output logic id_2,
    input logic id_3,
    output supply1 id_4,
    input logic id_5,
    input tri id_6
    , id_21,
    input wand id_7
    , id_22,
    input supply0 id_8,
    input tri0 id_9,
    output logic id_10,
    input tri id_11,
    input tri1 id_12,
    input logic id_13,
    input wire id_14,
    input logic id_15,
    output logic id_16,
    output supply0 id_17,
    inout tri0 id_18,
    input tri1 id_19
);
  always #1 begin : LABEL_0
    if (1) begin : LABEL_0
      fork : SymbolIdentifier
      join
      @(id_15 or posedge id_3) id_16 <= id_13;
    end else if (id_0) begin : LABEL_0
      id_2 <= id_3;
    end
  end
  final begin : LABEL_0
    id_10 = id_5;
  end
  wire id_23;
  assign id_22 = id_15 % id_6;
  always begin : LABEL_0
    id_10 <= 1'd0;
  end
  wire id_24;
  module_0 modCall_1 (
      id_23,
      id_24,
      id_22,
      id_24,
      id_23,
      id_24
  );
endmodule
