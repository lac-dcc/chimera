// Seed: 3544684745
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  always @(posedge ~id_1) begin : LABEL_0
    id_1 <= 1'b0 == 1;
  end
  assign id_1 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_3 = @(id_3) 1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    input uwire id_1,
    output tri id_2,
    input tri1 id_3,
    output tri0 id_4,
    output tri0 id_5
);
  assign id_4 = 1 - 1;
  assign id_2 = id_3;
  assign module_3.id_3 = 0;
endmodule
module module_3 (
    input tri0 id_0,
    input uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input wand id_4,
    output supply0 id_5,
    input tri1 id_6,
    output wand id_7,
    output wand id_8,
    input tri id_9,
    output tri0 id_10,
    input wire id_11,
    output wor id_12
);
  generate
    if (1) begin : LABEL_0
      assign id_8 = 1;
    end else begin : LABEL_0
      assign id_7 = id_4;
    end
  endgenerate
  module_2 modCall_1 (
      id_8,
      id_11,
      id_8,
      id_3,
      id_2,
      id_12
  );
endmodule
