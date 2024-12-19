// Seed: 2439146448
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  tri0 id_9;
  always @(posedge id_9 or posedge 1) if (id_9) id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  tri1 id_9, id_10, id_11 = 1;
  always @(id_9 or posedge 1) begin : LABEL_0
    id_1[1 : 1] <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11
  );
  wire id_12;
  supply1 id_13;
  initial begin : LABEL_0
    id_10 = |id_13;
  end
endmodule
