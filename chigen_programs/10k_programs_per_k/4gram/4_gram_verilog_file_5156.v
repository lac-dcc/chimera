// Seed: 1528743462
module module_0 (
    input uwire id_0,
    output wire id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    input supply0 id_5,
    input tri0 id_6
);
  wire id_8;
  parameter id_9 = -1, id_10 = 1, id_11 = id_6, id_12 = -1;
  wire id_13;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output logic id_3,
    input  uwire id_4,
    output logic id_5,
    output wor   id_6,
    output logic id_7,
    output uwire id_8,
    input  uwire id_9
);
  always @(posedge id_2 or negedge id_0) begin : LABEL_0
    id_7 <= id_4;
    cover (-1'b0);
    if (1) $unsigned(72);
    ;
    if (1 - 1) begin : LABEL_1
      if (1) begin : LABEL_2
        disable id_11;
      end else if (1)
        if (1 | 1 | 1 - -1 + 1 | 1 | 1 | -1 | 1) id_3 <= 1;
        else id_5 = 1 % id_6++;
    end
  end
  assign id_5 = -1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_9,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
