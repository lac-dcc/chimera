// Seed: 2492178413
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  tri0  id_2
);
  assign id_0 = 1;
endmodule
module module_1 (
    output wor   id_0,
    output wire  id_1,
    output wire  id_2,
    input  tri   id_3,
    input  logic id_4,
    output logic id_5,
    input  tri1  id_6,
    output logic id_7
    , id_11,
    output logic id_8,
    input  logic id_9
);
  always @(posedge 1'h0 or 1) begin : LABEL_0
    id_7 <= 1'h0;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_6
  );
  uwire id_12;
  reg   id_13;
  assign id_8 = id_4;
  always @(posedge id_4 or posedge id_9)
    if (id_13) begin : LABEL_0
      id_13 <= id_9;
    end else for (id_12 = 1; id_6; id_1 = 1) #1 id_1 = 1;
  task id_14;
    begin : LABEL_0
      id_13 <= id_14;
      id_5  <= 1;
    end
  endtask
endmodule
