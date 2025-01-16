// Seed: 1509268540
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2#(.id_3(id_4)),
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial id_6 = id_4;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_8
  );
  wire id_9 = id_1;
  wire id_10;
  wire id_11, id_12;
  wire id_13;
  always if (id_5) id_11 = -1;
  always begin : LABEL_0
    id_7  = -1;
    id_11 = 'h0 == -1'b0;
    id_10 += 1;
    begin : LABEL_0
      id_11 = 1;
    end
  end : SymbolIdentifier
  wire id_14, id_15;
  assign id_8 = 1;
endmodule
