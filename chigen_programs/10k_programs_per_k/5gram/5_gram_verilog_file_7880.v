// Seed: 2053437942
module module_0 (
    input  wor   id_0,
    input  wire  id_1,
    output wand  id_2,
    output logic id_3,
    input  wire  id_4,
    input  wire  id_5
);
  always_ff @(-1 or 1'b0, posedge id_0) begin : LABEL_0
    id_3 = #id_7 1;
  end
endmodule
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input wor module_1,
    input uwire id_4,
    input tri0 id_5,
    input wand id_6,
    output wor id_7,
    output logic id_8
);
  nor primCall (id_7, id_4, id_6, id_0);
  always @(1'b0 or posedge 1 ==? -1) begin : LABEL_0
    id_8 <= -1'b0;
    cover (-1);
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_8,
      id_4,
      id_5
  );
  assign modCall_1.id_7 = 0;
  logic id_10 = id_6;
endmodule
