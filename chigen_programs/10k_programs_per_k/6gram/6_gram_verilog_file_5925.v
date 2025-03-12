// Seed: 2201195036
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    output tri1 id_5,
    input tri id_6,
    output wand id_7
);
endmodule
module module_1 #(
    parameter id_9 = 32'd41
) (
    output supply1 id_0,
    output logic id_1,
    input wor id_2,
    output logic id_3,
    input tri id_4,
    input uwire id_5,
    input supply1 id_6,
    input wor id_7,
    input wor id_8,
    input wor _id_9,
    input wand id_10,
    input tri0 id_11,
    output logic id_12,
    output tri id_13
);
  initial begin : LABEL_0
    $unsigned(86);
    ;
    if (-1'h0 && 1) begin : LABEL_1
      id_1 = id_7 == id_5;
      id_3 <= id_8 ? 1 : -1;
    end else id_1 <= 1;
  end
  wire id_15;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_5,
      id_8,
      id_4,
      id_0,
      id_5,
      id_13
  );
  assign modCall_1.id_1 = 0;
  logic [id_9 : 1 'b0] id_16;
  ;
  xnor primCall (id_13, id_4, id_7, id_8, id_10, id_6, id_11, id_5, id_15, id_2);
  always @(id_5 << -1'b0 or posedge -1) id_12 = -1'h0;
endmodule
