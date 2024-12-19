// Seed: 258900484
module module_0 (
    input  tri1 id_0,
    input  wor  id_1,
    input  wire id_2,
    output tri1 id_3
);
  assign id_3 = id_2;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  tri   id_1,
    input  logic id_2,
    output logic id_3,
    input  logic id_4,
    input  logic id_5,
    output logic id_6
);
  wor id_8;
  nor primCall (id_6, id_4, id_5, id_2, id_10, id_8);
  always @(id_4 or negedge 1) begin : LABEL_0
    id_3 <= id_5;
    begin : LABEL_0
      id_3 = 1;
    end
  end
  assign id_0 = 1;
  logic id_9;
  always @(posedge 1 or posedge id_2) begin : LABEL_0
    id_6 <= id_4;
  end
  logic id_10;
  assign id_10 = id_5;
  assign id_8  = id_9 < id_8;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign id_6 = id_9;
  wire id_11;
  assign id_10 = 1;
endmodule
