// Seed: 345928614
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always
  fork : SymbolIdentifier
  join
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
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(*) begin : LABEL_0
    id_7 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_7,
      id_4,
      id_6,
      id_4
  );
  always_ff disable id_10;
endmodule
