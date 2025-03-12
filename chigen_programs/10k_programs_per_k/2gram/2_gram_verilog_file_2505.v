// Seed: 4237244443
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri0 id_4,
    output logic id_5,
    input wire id_6,
    output wand id_7,
    output tri0 id_8,
    input supply0 id_9
    , id_13,
    input tri1 id_10,
    input wor id_11
);
  parameter id_14 = -1;
  bit id_15;
  assign id_5 = 1;
  logic id_16;
  ;
  assign id_8 = ~-1;
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14,
      id_17
  );
  always begin : LABEL_0
    fork : SymbolIdentifier
      id_5 <= id_1;
    join
    $unsigned(77);
    ;
    @('b0 or posedge id_17 | 1 <-> !id_0) id_15 <= 1;
    SystemTFIdentifier;
    id_5 <= 1;
    for (id_15 = 1; 1; id_13++) id_13 = id_11;
  end
  wire id_18;
  assign id_17 = id_15;
endmodule
