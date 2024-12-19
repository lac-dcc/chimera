// Seed: 2043141500
module module_0;
  tri1   id_1;
  string id_2 = "";
  tri0   id_3 = 1;
  assign id_1 = 1;
  assign module_2.id_4 = 0;
  tri0 id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri0 id_0,
    input logic id_1,
    output supply0 id_2,
    input tri1 id_3,
    input wor id_4
);
  logic id_6 = id_1;
  always_ff @(1'b0 or posedge id_4) begin : LABEL_0
    id_6 <= 1;
  end
  module_0 modCall_1 ();
  assign id_6 = id_6;
endmodule
