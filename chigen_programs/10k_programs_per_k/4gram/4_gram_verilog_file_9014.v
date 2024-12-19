// Seed: 2211664989
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_4,
      id_5,
      id_12
  );
  assign id_12 = id_4;
  always_latch
    repeat (id_10) begin : LABEL_0
      id_2 = 1;
      id_10 <= 1;
      if (id_10)
        if (id_12) id_9 = 1;
        else;
      else begin : LABEL_0
        id_1 += id_7;
      end
    end
  or primCall (id_6, id_10, id_12, id_7, id_3, id_11, id_4);
  reg id_13;
  always
  fork : SymbolIdentifier
    id_13 <= 1;
  join_none : SymbolIdentifier
endmodule
