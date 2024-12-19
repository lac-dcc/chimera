// Seed: 2127787182
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input wire id_2,
    output logic id_3,
    input logic id_4,
    input tri id_5,
    input wire id_6,
    input wand id_7,
    input supply1 id_8
);
  reg id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_0,
      id_8
  );
  always @(1 or negedge id_7) begin : LABEL_0
    if (1 == 1) id_10 <= id_10;
    else id_3 <= id_4;
  end
endmodule
