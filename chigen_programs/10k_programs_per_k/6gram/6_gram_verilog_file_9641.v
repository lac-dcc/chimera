// Seed: 4020231849
module module_0 (
    input  wor   id_0,
    input  tri   id_1,
    output tri1  id_2,
    output logic id_3
);
  assign module_1.id_4 = 0;
  initial id_3 <= id_0;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    output supply0 id_2,
    output logic id_3,
    input tri0 id_4,
    input wand id_5,
    output tri id_6,
    output logic id_7,
    input wor id_8,
    output logic id_9,
    input tri id_10,
    output tri0 id_11,
    output tri id_12,
    output logic id_13,
    input tri0 id_14,
    inout tri id_15,
    output wor id_16
);
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_15,
      id_6,
      id_3
  );
  wire id_19;
  always @(id_15 or posedge 1) begin : LABEL_0
    id_9 <= 1;
    `define pp_20 0
    id_9 <= id_18;
    id_7 <= !id_18;
    if (1 == 1) begin : LABEL_1
      id_7  <= 1'b0;
      id_13 <= (-1);
      id_1  <= 1;
    end else begin : LABEL_2
      id_3 = `pp_20[1];
      cover (id_19);
    end
  end
endmodule
