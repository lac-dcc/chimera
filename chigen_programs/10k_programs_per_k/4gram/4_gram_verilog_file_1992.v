// Seed: 1870429204
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output supply1 id_2
    , id_17,
    input tri0 id_3,
    output uwire id_4,
    input tri id_5,
    input wor id_6,
    output wor id_7,
    input uwire id_8,
    input wor id_9,
    input wor id_10,
    input wand id_11,
    output supply1 id_12,
    input wor id_13,
    output supply1 id_14,
    input tri0 id_15
);
  parameter id_18 = 1'h0;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd80
) (
    output wor id_0,
    output logic id_1,
    output wire id_2,
    input supply0 id_3,
    input wor id_4,
    output tri0 id_5,
    output tri1 id_6,
    input supply0 id_7,
    output supply1 id_8,
    output tri id_9,
    input supply1 id_10,
    output wor _id_11,
    output tri id_12,
    input uwire id_13
);
  localparam id_15 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_5,
      id_10,
      id_4,
      id_5,
      id_4,
      id_3,
      id_10,
      id_3,
      id_9,
      id_3,
      id_12,
      id_4
  );
  always @(posedge -1) begin : LABEL_0
    id_1 = #1 id_13;
  end
  logic [-1 : id_11] id_16;
  ;
endmodule
