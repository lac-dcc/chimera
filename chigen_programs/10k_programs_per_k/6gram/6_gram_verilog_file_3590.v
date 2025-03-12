// Seed: 1449796279
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri0 id_5,
    output wor id_6,
    input tri1 id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri1 id_10,
    input tri0 id_11,
    output wire id_12,
    input wire id_13,
    input wand id_14,
    input supply1 id_15,
    output tri0 id_16,
    input supply0 id_17,
    output supply1 id_18,
    output wand id_19,
    input tri1 id_20,
    input supply0 id_21,
    output wire id_22,
    input tri0 id_23,
    output tri1 id_24,
    input tri0 id_25,
    output wor id_26,
    input supply0 module_0
);
  wire id_29;
  ;
  assign module_1.id_2 = 0;
  localparam id_30 = 1;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wor id_3
);
  reg id_5;
  ;
  reg id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1
  );
  assign id_0 = id_6;
  always @(*) begin : LABEL_0
    if (1'b0 && 1)
      if (-1) id_5 <= id_1;
      else begin : LABEL_1
        id_6 <= (id_5);
      end
    else id_0 = id_6;
  end
endmodule
