// Seed: 3956060512
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    output logic id_4,
    input tri0 id_5,
    output logic id_6,
    input wand id_7,
    input supply0 id_8,
    output logic id_9
);
  initial
    for (id_6 = 1; 1'd0; id_6 = id_5)
      if (1) begin : LABEL_0
        id_4 <= 1 * 1;
        deassign id_4;
      end else id_9 <= -1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input wand id_2,
    input wand id_3,
    output logic id_4,
    output logic id_5,
    output logic id_6,
    input wand id_7
);
  always @(posedge 1) begin : LABEL_0
    @(posedge 1, id_1 ? id_7 : 1) id_5 = id_0;
    id_4 <= 1;
    id_4 <= 1;
    id_6 = id_0;
    id_6 <= id_3;
  end
  always #id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
