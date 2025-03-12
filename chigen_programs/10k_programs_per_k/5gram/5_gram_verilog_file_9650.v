// Seed: 1035003534
module module_0 (
    input  wand  id_0,
    output logic id_1,
    input  tri   id_2,
    input  tri1  id_3,
    input  wor   id_4
);
  wire id_6;
  always if (1) deassign id_1;
  always @(1 or negedge id_6) begin : LABEL_0
    id_1 = -1'b0;
  end
  wire id_7;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output logic id_3,
    input tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    output uwire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wor id_10
);
  wire  id_12;
  logic id_13;
  ;
  always @(posedge id_8 - 1) begin : LABEL_0
    id_3 <= -1;
  end
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8,
      id_5,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
