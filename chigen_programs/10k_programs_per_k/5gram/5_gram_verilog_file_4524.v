// Seed: 1358687940
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wire id_3,
    output supply1 id_4,
    output logic id_5,
    output logic id_6,
    output wand id_7,
    input tri0 id_8,
    output wor id_9,
    output supply0 id_10,
    output supply1 id_11,
    input wor id_12
);
  logic id_14 = "" == id_8;
  initial begin : LABEL_0
    id_14 <= {-1'b0 - 1{id_14 !=? -1}};
  end
  always @(1) begin : LABEL_1
    #1;
    id_5 = new;
    id_6 <= 1;
    id_5 = -1;
    release id_3;
    if (1) id_5 <= id_12;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input tri1 id_2,
    input wor id_3,
    output tri0 id_4,
    input supply1 id_5,
    input uwire id_6,
    output tri id_7,
    input wor id_8,
    input wor id_9,
    input wand id_10,
    output supply1 id_11,
    output wor id_12,
    input supply1 id_13
);
  always_ff @(posedge id_10 or posedge id_10) id_0 = 1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_1,
      id_12,
      id_4,
      id_7,
      id_10
  );
  assign id_7 = id_9;
endmodule
