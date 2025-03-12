// Seed: 2098082712
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output tri id_2
);
  assign id_2 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd10,
    parameter id_3  = 32'd5
) (
    input tri1 id_0,
    input tri1 id_1,
    output logic id_2,
    input supply1 _id_3,
    output uwire id_4,
    input wand id_5,
    output wor id_6,
    input uwire id_7
    , id_19,
    input supply1 id_8,
    input tri id_9,
    output wor id_10,
    input tri0 _id_11,
    input supply1 id_12,
    input wor id_13,
    input wand id_14,
    input wor id_15,
    input supply0 id_16,
    input wand id_17
);
  wire [id_11 : ~  id_3] id_20;
  wire id_21, id_22;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_6
  );
  logic [(  1  ) : ""] id_23;
  ;
  always @(id_8) begin : LABEL_0
    assert (id_13);
    id_2 <= 1;
  end
endmodule
