// Seed: 2558462631
module module_0 (
    output supply0 id_0,
    input wire id_1,
    input wire id_2,
    input uwire id_3,
    output supply0 id_4,
    output wand id_5,
    output tri0 id_6
);
  id_8(
      .id_0(1), .id_1(id_4), .id_2(1), .id_3()
  );
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    output tri id_5,
    output uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    output tri0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input supply1 id_12,
    output tri id_13,
    output supply0 id_14,
    input uwire id_15,
    output tri0 id_16
);
  always @(posedge 1 or negedge 1 + 1'd0) begin : LABEL_0
    if (1) begin : LABEL_0
      forever $display(1);
    end else begin : LABEL_0
      id_2 = 1'b0;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_12,
      id_1,
      id_5,
      id_13
  );
  assign modCall_1.type_4 = 0;
endmodule
