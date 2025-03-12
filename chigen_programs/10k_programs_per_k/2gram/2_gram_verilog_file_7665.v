// Seed: 1336387253
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input tri0 id_2,
    input tri id_3,
    output tri0 id_4,
    output wand id_5,
    input wire id_6,
    input supply0 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10,
    output tri1 id_11 id_22,
    input supply0 id_12,
    input wire id_13,
    output wand id_14,
    input supply0 id_15,
    output supply1 id_16,
    input uwire id_17,
    output uwire id_18,
    output wand id_19,
    input supply0 id_20
    , id_23
);
  parameter id_24 = -1;
endmodule
module module_1 #(
    parameter id_8 = 32'd54
) (
    output supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output tri0 id_7,
    input tri0 _id_8,
    output logic id_9
);
  id_11 :
  assert property (@(id_6 or 1) 1'h0)
  else begin : LABEL_0
    @(id_5) id_9 <= -1;
  end
  wire id_12 = id_11;
  logic [id_8 : 1 'b0] id_13;
  ;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_3,
      id_4,
      id_1,
      id_7,
      id_4,
      id_6,
      id_5,
      id_6,
      id_2,
      id_1,
      id_4,
      id_6,
      id_0,
      id_4,
      id_1,
      id_4,
      id_7,
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
  localparam id_14 = "";
endmodule
