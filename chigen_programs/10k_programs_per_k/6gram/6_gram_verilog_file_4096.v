// Seed: 3627223292
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    output wire id_5,
    input wand id_6,
    output logic id_7,
    output supply0 id_8,
    output supply1 id_9,
    input tri id_10,
    input wor id_11,
    output tri1 id_12
    , id_15,
    output tri id_13
);
  always id_7 = #1 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd16,
    parameter id_5 = 32'd92
) (
    input wor id_0,
    input supply1 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply1 _id_4,
    input uwire _id_5,
    output logic id_6,
    input wor id_7,
    input uwire id_8,
    output wor id_9
    , id_14,
    input tri1 id_10,
    input supply1 id_11,
    output tri0 id_12
);
  always @(posedge id_2 | id_14 * 1) begin : LABEL_0
    if (1) begin : LABEL_1
      if (1)
        if (1) for (id_9 = id_8; 1 < id_8; id_6 = (id_11)) id_6 <= 1;
        else id_14[id_5 : id_4] = id_3;
    end else id_6 = id_8;
  end
  wire id_15;
  ;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_9,
      id_3,
      id_9,
      id_12,
      id_7,
      id_6,
      id_9,
      id_9,
      id_1,
      id_0,
      id_12,
      id_9
  );
endmodule
