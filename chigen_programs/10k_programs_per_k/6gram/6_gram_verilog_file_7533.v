// Seed: 1141484027
module module_0 (
    output wand id_0,
    input tri id_1,
    input supply0 id_2,
    input wand id_3,
    input wor id_4
);
  wire [1 : 1] id_6;
  wire id_7;
  assign id_7 = 1;
  always #(id_7) {id_4, id_2} <= -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output uwire id_2,
    output wor   id_3,
    input  wor   id_4,
    output logic id_5,
    output logic id_6
);
  initial begin : LABEL_0
    #1 id_5 = 1'b0;
    id_6 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_1
  );
  integer id_8, id_9;
  always @(negedge 1) begin : LABEL_1
    id_6 = id_8;
    @(posedge 1 == id_9) id_9 = ~id_0;
  end
endmodule
