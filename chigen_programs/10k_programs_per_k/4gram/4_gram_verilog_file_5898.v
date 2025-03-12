// Seed: 4018215359
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output supply0 id_2,
    input wor id_3,
    output wor id_4
);
  logic id_6;
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd40
) (
    input wor id_0,
    input tri id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire _id_4,
    input tri id_5,
    output tri0 id_6,
    output wand id_7,
    input tri0 id_8,
    output logic id_9,
    input tri id_10,
    input wor id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    input uwire id_15,
    input wor id_16,
    input tri1 id_17,
    output logic id_18
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_3,
      id_16,
      id_6,
      id_3,
      id_7
  );
  always @(negedge id_14) begin : LABEL_0
    id_9 <= id_8;
    fork
      id_18 <= id_12;
    join
  end
  wire id_20;
  logic [id_4 : 1] id_21;
  generate
    assign id_6 = id_14;
  endgenerate
  and primCall (
      id_18,
      id_13,
      id_8,
      id_3,
      id_15,
      id_11,
      id_2,
      id_17,
      id_0,
      id_1,
      id_10,
      id_16,
      id_12,
      id_5,
      id_14
  );
endmodule
