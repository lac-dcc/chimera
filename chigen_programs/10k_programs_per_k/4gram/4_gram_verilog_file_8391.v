// Seed: 3116315149
module module_0 (
    output wire id_0,
    input supply0 id_1,
    output wire id_2
);
  wire id_4;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd70,
    parameter id_7  = 32'd11,
    parameter id_9  = 32'd5
) (
    input supply0 id_0,
    output tri id_1,
    output tri0 id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    input wor id_6,
    input tri _id_7,
    input tri0 id_8,
    output tri _id_9,
    output wor id_10,
    output logic id_11
);
  wire _id_13 = id_6;
  bit id_14 = -1;
  logic [7:0] id_15;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_2
  );
  always @(posedge 1) begin : LABEL_0
    id_14 <= 1;
    if (1 || -1 & -1 - 1) begin : LABEL_1
      if ((1)) begin : LABEL_2
        if (-1) if (1 & (1) + -1) id_11 <= id_15[id_13];
      end
    end
  end
  struct packed {
    logic [1 : 1] id_16;
    logic [id_7 : 1] id_17;
  } ["" : id_9] id_18;
  ;
  assign id_18.id_16 = -1;
  assign id_1 = id_18.id_17[id_13 : 1];
endmodule
