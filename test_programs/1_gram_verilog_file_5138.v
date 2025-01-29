// Seed: 3583290487
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    input tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input tri0 id_10
);
  wire id_12 = -1;
  wire id_13;
  assign id_8 = 1'b0;
  if (id_10) begin : LABEL_0
    begin : LABEL_0
      localparam id_14 = 1'b0;
    end
    wire id_15;
  end else begin : LABEL_0
    wire id_16, id_17;
  end
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1
);
  assign id_3 = 1'b0 == (1 + id_0);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_6 = 0;
  parameter id_4 = 1 | 1;
  assign id_3 = id_1;
endmodule
