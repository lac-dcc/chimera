// Seed: 3378053604
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output wor id_2,
    input wand id_3,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    output tri0 id_9,
    input wand id_10,
    output tri0 id_11,
    input supply0 id_12,
    output wor id_13
);
  wire id_15;
  wire id_16;
  wire id_17;
  wire id_18;
  tri0 id_19;
  assign id_13 = id_19;
  assign id_11 = 1;
  assign id_19 = id_3;
  supply0 id_20 = 1'h0, id_21;
  wire id_22;
  id_23(
      .id_0(1), .id_1(1), .id_2(1), .id_3(), .id_4(1)
  );
  tri id_24;
  id_25(
      .id_0(1'b0), .id_1(id_20), .id_2()
  );
  initial begin : LABEL_0
    if (1 == id_24) id_0 = ~id_21;
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output tri   id_4,
    input  tri1  id_5,
    input  uwire id_6,
    input  wor   id_7,
    input  tri   id_8,
    output wor   id_9
);
  always @(1, id_5 or 1 or posedge id_0) begin : LABEL_0
    if (1) begin : LABEL_0
      id_9 = id_0;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_1,
      id_5,
      id_6,
      id_7,
      id_1,
      id_2,
      id_9,
      id_1,
      id_4,
      id_3,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
