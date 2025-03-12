// Seed: 1124164825
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output wand  id_2
);
  assign id_2 = 1;
  assign module_2.id_4 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3,
    output tri1 id_4,
    output supply0 id_5,
    input tri id_6,
    input wand id_7
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5
  );
  wire id_9;
  assign id_5 = id_9 == 1;
endmodule
module module_0 (
    output logic id_0,
    output logic id_1,
    input  tri   id_2,
    output tri1  id_3,
    input  wire  id_4,
    output logic id_5
);
  assign id_3 = 1 && -1 && 1;
  reg  id_7;
  wire module_2;
  assign id_1 = -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3
  );
  always @(posedge id_2 or posedge id_7) begin : LABEL_0
    id_1 <= -1'b0;
    fork
      begin : LABEL_1
        if (-1) id_7 <= 1;
      end
    join_any
    id_0 = 1;
    id_5 = id_4;
  end
  logic id_8;
endmodule
