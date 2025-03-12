// Seed: 894525256
module module_0;
  logic id_1 = ~id_1, id_2;
  parameter id_3 = -1'h0;
  assign module_1.id_2 = 0;
  logic id_4[-1 : 1];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  output reg id_2;
  module_0 modCall_1 ();
  output wire id_1;
  always @(id_3) begin : LABEL_0
    id_2 = 1 ? id_5 : (id_4);
    id_3[(-1)] = id_4;
  end
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  assign module_3.id_1 = 0;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  ;
  localparam id_10 = 1;
  assign id_4 = id_3;
  always disable id_11;
endmodule : SymbolIdentifier
module module_3 #(
    parameter id_1 = 32'd46
) (
    output supply1 id_0,
    input tri _id_1,
    output tri id_2,
    output supply0 id_3,
    output supply0 id_4
);
  wire [id_1 : -1] id_6;
  module_2 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
