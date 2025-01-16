// Seed: 4227604644
module module_0 (
    input tri0 id_0,
    input logic id_1,
    output logic id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    output logic id_6
);
  task id_8;
    if (id_0) @(posedge id_5) if (id_0) id_2 = (-1);
    ;
  endtask
  always id_2 <= id_1;
  assign module_1.id_5 = 0;
  always id_6 <= id_8;
  wire id_9, id_10;
endmodule
module module_1 (
    output tri1  id_0,
    input  wor   id_1,
    output tri   id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output wor   id_5,
    output logic id_6,
    input  tri0  id_7,
    input  uwire id_8,
    output logic id_9,
    input  logic id_10,
    input  tri1  id_11
);
  assign id_5 = id_7;
  always
    if (1) begin : LABEL_0
      id_6 <= id_10;
      disable id_13[-1];
      if (1'd0) id_9 = (1);
      id_9 <= 1 <-> id_11;
      begin : LABEL_0
        id_6 += 1;
      end
    end
  module_0 modCall_1 (
      id_11,
      id_10,
      id_6,
      id_3,
      id_11,
      id_8,
      id_9
  );
  wire id_14, id_15;
endmodule
