// Seed: 3119702646
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_5 = 1 !== 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  case (id_1)
    1: begin : LABEL_0
      always deassign id_4;
    end
    -1: begin : LABEL_1
      genvar id_5;
    end : SymbolIdentifier
  endcase
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_6,
      id_6
  );
  assign id_6 = id_1["" : {-1, 1}<1];
endmodule
