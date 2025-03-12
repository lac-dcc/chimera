// Seed: 3274734438
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output wor id_2,
    input wor id_3
    , id_15,
    input wand id_4,
    input wire id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wire id_8,
    input wor id_9,
    input wire id_10,
    input wor id_11,
    input wor id_12,
    input wire id_13
);
  wire id_16 = id_7;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    inout logic id_0,
    output supply0 id_1,
    output supply1 id_2,
    output logic id_3,
    input supply0 id_4,
    input tri0 id_5
);
  initial begin : LABEL_0
    #(-1) begin : LABEL_1
      id_0 <= id_4;
      id_3 = id_4 + -1;
    end
  end
  assign id_1 = 1;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_1,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
