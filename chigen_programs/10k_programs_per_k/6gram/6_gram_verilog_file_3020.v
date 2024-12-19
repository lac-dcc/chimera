// Seed: 2606101572
module module_0 (
    input  tri0 id_0,
    output wor  id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  wand id_4,
    input  tri1 id_5
);
  assign id_1 = 1'h0 ? 1 : (1);
  wire id_7;
  wire id_8;
  reg  id_9;
  assign module_1.type_1 = 0;
  initial begin : LABEL_0
    id_9 <= 1'h0;
    id_3 = 1;
  end
endmodule
module module_1 (
    input  logic   id_0,
    output logic   id_1,
    input  logic   id_2,
    input  supply0 id_3,
    output supply1 id_4
);
  logic id_6;
  assign id_4 = 1;
  always @(posedge id_6 or id_0) begin : LABEL_0
    id_1 <= id_6 ? id_0 : 1;
    wait (id_2);
    id_6 += 1;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
