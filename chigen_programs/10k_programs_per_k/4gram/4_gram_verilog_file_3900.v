// Seed: 1391215021
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output wor id_4,
    input tri0 id_5
    , id_12,
    output tri1 id_6,
    input supply1 id_7,
    input tri id_8,
    output supply1 id_9,
    input wor id_10
);
  wire id_13;
  always @(posedge 1) id_12 = 1 - id_12;
  always_comb @*;
  wire id_14;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    output logic id_5
);
  always @(1 or posedge id_4 or negedge id_2 + id_4)
    if (id_4) begin : LABEL_0
      if (id_2) id_5 <= 1'b0;
      else begin : LABEL_0
        id_1 <= 1;
      end
    end
  assign id_0 = id_2;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_4,
      id_2,
      id_0,
      id_4
  );
endmodule
