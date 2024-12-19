// Seed: 2094794165
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input wor id_2,
    output tri0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    input tri0 id_8,
    output uwire id_9,
    input wand id_10,
    input tri1 id_11
);
  assign id_9 = (id_5);
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    input  tri   id_0,
    input  wor   id_1,
    output logic id_2,
    output tri1  id_3,
    input  logic id_4,
    input  uwire id_5
);
  logic [7:0] id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_3,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
  always_ff begin : LABEL_0
    #1 @(posedge id_4 or 1);
    if (1) begin : LABEL_0
      id_2 <= id_4;
    end else id_7[1] <= ~^1 == "";
  end
  wire id_8;
endmodule
