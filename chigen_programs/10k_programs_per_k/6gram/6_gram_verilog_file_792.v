// Seed: 1300746541
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wor id_2,
    input wire id_3,
    input supply0 id_4,
    input wand id_5,
    input tri id_6,
    output supply1 id_7,
    output supply0 id_8
);
  supply1 id_10;
  tri id_11;
  wor id_12 = 1'b0;
  always @(id_4) begin : LABEL_0
    if (id_2) begin : LABEL_0
      if (id_0) assume (id_2);
    end else begin : LABEL_0
      #1 id_11 = id_10 == 1'h0;
    end
  end
endmodule
module module_1 (
    input  logic id_0,
    input  tri0  id_1,
    output logic id_2,
    input  wire  id_3,
    output wire  id_4
);
  always id_2 = #1 id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
