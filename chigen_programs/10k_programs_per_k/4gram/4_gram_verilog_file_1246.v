// Seed: 2743154434
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6
);
  assign module_1.id_14 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd96
) (
    output wand id_0,
    input uwire id_1,
    output tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    output wire id_5,
    input tri1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input wire id_9,
    output logic id_10,
    input wire id_11,
    output wire id_12,
    input wire _id_13,
    output tri0 id_14
);
  wire id_16;
  bit id_17;
  bit id_18;
  wire [1 : id_13] id_19;
  logic id_20;
  ;
  assign id_18 = 1 / id_11;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_9,
      id_1,
      id_3,
      id_6
  );
  always @(*) begin : LABEL_0
    @(posedge id_3)
    if (1 == 1) begin : LABEL_1
      id_20 <= id_9;
      id_18 <= 1'h0;
    end else begin : LABEL_2
      if (-1 == 1) begin : LABEL_3
        id_17 = id_18;
      end
    end
    wait (-1);
    id_10 <= -1;
  end
endmodule
