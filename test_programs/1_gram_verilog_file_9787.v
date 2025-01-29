// Seed: 1414310317
module module_0 (
    input wor id_0,
    output tri id_1,
    output supply0 id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input wire id_9,
    output tri id_10
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    input  tri   id_2
);
  tri id_4;
  always_ff id_0 <= 1'b0;
  wand id_5, id_6;
  parameter id_7 = id_4 - 1'b0;
  logic [7:0] id_8;
  assign id_1 = id_5;
  wire id_9;
  parameter id_10 = -1;
  assign id_8[-1'b0].id_6 = 1;
  always begin : LABEL_0
    id_4 = id_6;
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_2,
      id_5,
      id_6,
      id_2,
      id_1
  );
endmodule
