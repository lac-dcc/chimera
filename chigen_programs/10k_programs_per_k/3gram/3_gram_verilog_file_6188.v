// Seed: 3105761556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_5;
  assign id_5 = id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  initial id_1 <= #1 id_2;
  reg  id_3 = id_3;
  tri1 id_4;
  initial
    @(~1 or 1 - id_4) begin : LABEL_0
      id_1 = id_4 + 1;
    end
  always @(id_3) id_1 <= 1'b0;
  integer id_5;
  always @(1 + 1 or posedge 1) begin : LABEL_0
    id_5 <= id_3;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_7 = 1'b0;
  always @(posedge id_3)
  fork
    id_1 <= (1);
    id_7 <= id_5 == id_3;
  join : SymbolIdentifier
endmodule
