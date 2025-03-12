// Seed: 1256412752
module module_0 (
    input tri id_0,
    input wor id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply0 id_6
);
  logic id_8;
  reg   id_9;
  assign id_9 = -1;
  always @(id_0 or posedge id_2 or posedge -1) begin : LABEL_0
    id_8 = id_3;
    id_8 <= -1'b0 <= 1;
    `define pp_10 0
    fork
      id_11();
    join
    id_9 <= id_5 == 1;
    id_8 <= 1;
    if (1) begin : LABEL_1
      deassign id_8;
    end else disable id_12;
  end
  assign id_9 = id_1;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    input  uwire id_2,
    output wand  id_3
);
  logic id_5;
  initial begin : LABEL_0
    id_1 <= 1 != id_2;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
