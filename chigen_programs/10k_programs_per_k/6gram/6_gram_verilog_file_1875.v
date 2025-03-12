// Seed: 3031937429
module module_0 (
    output logic id_0,
    output tri0 id_1,
    input uwire id_2,
    input supply0 id_3
    , id_13,
    input tri id_4,
    input tri1 id_5,
    input tri id_6,
    input wand id_7,
    output wor id_8,
    input wire id_9,
    output logic id_10,
    input wor id_11
);
  assign id_13 = id_9;
  localparam id_14 = -1;
  always @(posedge id_14)
    for (id_1 = id_2; 1 == id_3; id_8 += id_2)
      for (id_8 = id_7; id_13; id_0 = id_13) id_10 <= !id_13;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  tri1  id_2,
    output logic id_3,
    input  wire  id_4,
    output tri0  id_5
);
  assign id_1 = -1;
  generate
    for (id_7 = -1'b0 ~^ -1; id_0; id_3 = id_0) begin : LABEL_0
      wire id_8;
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_2,
      id_0,
      id_4,
      id_0,
      id_5,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
