// Seed: 1550861856
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
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9;
  assign id_5 = id_8 + 1'b0;
  initial begin : LABEL_0
    id_5 = id_4;
  end
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output logic id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6
);
  tri id_8;
  assign id_2 = {!id_4{1}} ==? id_3;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  always @(posedge id_0 or id_5) begin : LABEL_0
    id_2 <= 1;
  end
  initial begin : LABEL_0
    id_2 <= 1;
    if (id_8) assert (id_3);
    assert (1'h0);
  end
endmodule
