// Seed: 396915095
module module_0 #(
    parameter id_5 = 32'd66
) (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    output logic id_3
);
  parameter id_5 = 1;
  always @(posedge id_2 or posedge id_0) begin : LABEL_0
    if (1) $signed(id_5);
    ;
  end
  always @(posedge -1 - 1'd0) begin : LABEL_1
    id_3 = -1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    input wire id_3,
    input tri0 id_4,
    output logic id_5
);
  initial begin : LABEL_0
    if (1 && -1'h0 == -1) begin : LABEL_1
      $unsigned(15);
      ;
    end
    id_5 = id_4;
    if (-1 && -1 && 1'b0) disable id_7;
  end
  or primCall (id_5, id_4, id_0, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
