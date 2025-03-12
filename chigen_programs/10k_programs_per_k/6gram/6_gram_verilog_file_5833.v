// Seed: 1829123381
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output supply0 id_2,
    output logic id_3,
    input wor id_4,
    input supply1 id_5,
    output uwire id_6
    , id_8
);
  always @(1'b0) begin : LABEL_0
    if (1'd0) id_3 = -1;
    else id_8[1'd0] <= id_1;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    output tri1 id_7,
    input supply1 id_8,
    input wor id_9,
    output logic id_10,
    output wire id_11
);
  always @(negedge id_3)
    if (1)
      if (1)
        if (1) id_10 <= 1 & id_9;
        else id_10 <= 1'b0;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_11,
      id_10,
      id_6,
      id_5,
      id_11
  );
endmodule
