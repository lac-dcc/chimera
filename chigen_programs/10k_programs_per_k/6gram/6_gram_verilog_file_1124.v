// Seed: 1335312083
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  assign module_1.id_1 = 0;
  input wire id_4;
  inout wire id_3;
  output reg id_2;
  inout wire id_1;
  always id_2 <= #1 id_1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply0 id_3
);
  reg  id_5;
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_6,
      id_6
  );
  always @(posedge id_1 or posedge id_6 == id_2) begin : LABEL_0
    id_5 = -1'b0;
  end
endmodule
