// Seed: 3642186490
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input wand id_2,
    input wand id_3,
    input tri id_4,
    output tri id_5,
    input supply0 id_6
    , id_8
);
  wor  id_9;
  wire id_10;
  assign id_9 = 1'd0;
  wire id_11;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    output tri0 id_2,
    input wor id_3,
    input wor id_4,
    input supply1 id_5,
    input logic id_6,
    output logic id_7,
    input tri0 id_8,
    input supply0 id_9,
    input uwire id_10,
    output supply1 id_11
    , id_14,
    output supply0 id_12
);
  module_0 modCall_1 (
      id_2,
      id_12,
      id_5,
      id_9,
      id_5,
      id_11,
      id_4
  );
  assign modCall_1.id_5 = 0;
  always @(*) begin : LABEL_0
    wait ((id_0 == id_14));
    id_7 <= id_6;
  end
  initial begin : LABEL_0
    if (1) id_14 <= #1 id_0;
    else begin : LABEL_0
      id_14 <= id_1;
      id_14 = 1;
      id_2  = id_10;
    end
  end
endmodule
