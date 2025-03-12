// Seed: 232219276
module module_0 (
    output wor id_0,
    input uwire id_1,
    output wor id_2,
    input tri id_3,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7,
    output tri id_8
);
  wire  id_10;
  logic id_11;
  ;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input tri1 id_2,
    input uwire id_3,
    output wire id_4,
    output wand id_5,
    input tri0 id_6,
    output wire id_7,
    input tri0 id_8,
    output logic id_9
);
  logic [7:0] id_11;
  ;
  wire id_12;
  assign id_5 = id_11;
  always @(posedge id_2 - id_8) begin : LABEL_0
    if ("") id_9 <= #id_6 -1;
    else
      #1 begin : LABEL_1
        id_11[1] <= id_8;
      end
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_4,
      id_8,
      id_6,
      id_2,
      id_3,
      id_3,
      id_5
  );
endmodule
