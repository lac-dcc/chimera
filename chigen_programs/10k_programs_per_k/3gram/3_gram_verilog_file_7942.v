// Seed: 4101481476
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4
);
  localparam id_6 = 1;
  assign module_2.id_0 = 0;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input wor id_2
    , id_8,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    input wire id_6
);
  assign id_8[-1] = id_6;
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_0
  );
endmodule
module module_2 (
    input supply1 id_0,
    output supply1 id_1,
    input tri id_2,
    output tri1 id_3,
    output logic id_4,
    input supply1 id_5,
    output uwire id_6,
    input supply1 id_7,
    output wor id_8,
    output supply1 id_9,
    input tri0 id_10
);
  wire id_12;
  always @(posedge 1) begin : LABEL_0
    id_4 <= 1'h0;
  end
  nand primCall (id_6, id_0, id_2, id_12, id_5, id_7, id_10);
  assign id_6 = id_10;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_2,
      id_5,
      id_6
  );
  generate
    assign id_1 = id_10;
  endgenerate
  assign id_8 = -1 ? id_5 : 1;
endmodule
