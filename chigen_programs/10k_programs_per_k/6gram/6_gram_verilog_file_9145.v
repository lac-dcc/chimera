// Seed: 1406271365
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    input tri0 id_3,
    input tri id_4,
    input wor id_5,
    output supply1 id_6,
    output supply0 id_7
    , id_10,
    output uwire id_8
);
  assign id_10 = "";
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1
);
  assign id_1 = ~id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1
  );
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
endmodule
module module_2 (
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
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_25;
  assign id_23 = 1;
  assign id_4  = (id_6 < id_14);
  wire id_26;
  wire id_27;
  always @(posedge 1) begin : LABEL_0
    id_18 = 1;
  end
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  module_2 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7,
      id_6,
      id_7,
      id_4,
      id_4,
      id_1,
      id_8,
      id_6,
      id_4,
      id_4,
      id_6,
      id_1,
      id_8,
      id_4,
      id_7,
      id_7,
      id_4,
      id_2,
      id_8
  );
  always @(id_2 <= $display(id_3[1]
  ) or 1'b0)
  begin : LABEL_0
    begin : LABEL_0
      if (1 == 1) id_5 <= 1;
    end
  end
endmodule
