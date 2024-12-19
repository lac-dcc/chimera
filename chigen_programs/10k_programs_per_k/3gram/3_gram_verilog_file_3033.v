// Seed: 1974031934
module module_0 (
    output logic id_0,
    input  logic id_1,
    input  wor   id_2,
    input  wor   id_3,
    input  logic id_4,
    output logic id_5,
    input  logic id_6,
    input  uwire id_7,
    input  tri1  id_8,
    output logic id_9
);
  always @(posedge id_7) id_0 <= id_6;
  assign id_5 = 1;
  supply1 id_11 = id_3;
  wor id_12;
  wire id_13;
  assign id_9 = 1;
  always @(posedge (id_8) or posedge 1);
  always @(1 or posedge id_11) id_9 <= 1 / 1'b0;
  always @(*);
  assign id_11 = id_12;
  final $display(1);
  assign id_13 = id_13;
  assign id_0  = id_1;
  wire id_14;
  assign id_12 = 1;
  wire id_15;
endmodule
module module_1 (
    output tri   id_0,
    input  tri0  id_1,
    input  logic id_2,
    output tri1  id_3,
    output logic id_4
);
  always_ff @(posedge id_1) begin : LABEL_0$display
    ;
    id_4 <= id_2;
  end
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.type_4 = 0;
  wire id_7, id_8, id_9, id_10, id_11, id_12;
endmodule
