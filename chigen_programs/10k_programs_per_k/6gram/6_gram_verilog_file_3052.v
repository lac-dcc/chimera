// Seed: 2035617503
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output wand id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input tri id_8,
    input wand id_9,
    output supply0 id_10,
    input uwire id_11,
    output uwire id_12
);
  uwire id_14 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    input  logic id_2,
    input  uwire id_3,
    input  tri   id_4,
    input  wire  id_5,
    output logic id_6
);
  always @(negedge id_5) begin : LABEL_0
    if (1) begin : LABEL_0
      id_6 <= 1;
    end else id_6 <= id_2;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_0,
      id_5,
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_0,
      id_4,
      id_0
  );
endmodule
