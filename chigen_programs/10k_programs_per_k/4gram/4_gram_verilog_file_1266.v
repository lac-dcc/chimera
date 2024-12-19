// Seed: 1715299344
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input tri1 id_4
);
  wire id_6;
  always @(posedge 1) $display;
  generate
    always @(*) begin : LABEL_0
      id_3 += id_2;
    end
  endgenerate
  assign module_2.id_2 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    output wand id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_3,
      id_0
  );
endmodule
module module_2 (
    input supply1 id_0,
    output tri1 id_1,
    output logic id_2,
    input wor id_3
);
  wire id_5 = 1'd0 != 1'b0;
  id_6(
      .id_0(1), .id_1(~id_0), .id_2(1'b0), .id_3(1)
  );
  generate
    initial begin : LABEL_0
      id_2 <= 1;
    end
    always @(posedge
    id_1++
    )
      if (1) begin : LABEL_0
        id_2 = 1;
      end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0
  );
endmodule
