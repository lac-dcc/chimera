// Seed: 1087675566
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri id_2,
    output tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    output wand id_8,
    input supply1 id_9,
    output wand id_10,
    input wire id_11,
    output wand id_12
);
  wire id_14;
  assign id_1 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    output tri0 id_2,
    output logic id_3
    , id_8,
    input logic id_4,
    input tri id_5,
    input supply1 id_6
);
  assign id_3 = id_8;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_2,
      id_6,
      id_6,
      id_5,
      id_6,
      id_2,
      id_0,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.type_0 = 0;
  tri0 id_9;
  for (id_10 = 1; (id_4); id_10 = id_8) begin : LABEL_0
    if (1) begin : LABEL_0
      assign id_3 = 1'd0;
    end else begin : LABEL_0
      wire id_11;
      assign id_2 = 1'h0;
      wire id_12;
    end
    always @(posedge id_10) id_1 <= id_8;
    assign id_9 = 1;
  end
  assign id_2 = 1;
endmodule
