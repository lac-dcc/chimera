// Seed: 2702764721
module module_0 (
    input  tri   id_0,
    input  uwire module_0,
    output uwire id_2
);
  wire id_4;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri0 id_4,
    input wire id_5,
    input wand id_6,
    input wire id_7,
    output logic id_8,
    input wand id_9,
    input supply1 id_10,
    input wor id_11,
    output wire id_12,
    input supply1 id_13
);
  always @(posedge 1, negedge 1) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_8 <= id_9 + id_6;
      id_12 = $display;
      foreach (id_15[1]) id_0 = (id_4 & 1'd0 - 1);
    end
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_12
  );
  assign modCall_1.type_0 = 0;
endmodule
