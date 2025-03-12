// Seed: 1924369028
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wire  id_3
);
  assign id_0 = 1'h0 ? id_3 : 1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd40
) (
    input tri1 id_0,
    input tri0 id_1,
    output wor id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri0 id_7,
    output supply1 id_8,
    input tri id_9,
    output tri0 _id_10,
    output tri id_11,
    input wor id_12,
    input tri0 id_13,
    input tri0 id_14,
    input wor id_15,
    input wire id_16,
    input tri1 id_17,
    output supply0 id_18,
    output wand id_19
);
  wire id_21;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_16,
      id_4
  );
  assign id_11 = 1;
  logic [1 'd0 : id_10] id_22;
  logic id_23 = -1;
  xnor primCall (id_7, id_17, id_15, id_21, id_16, id_13, id_5, id_3);
  always @* begin : LABEL_0
    assert (id_16 && 1 && id_3);
    $clog2(75);
    ;
  end
  assign id_19 = -1;
endmodule
