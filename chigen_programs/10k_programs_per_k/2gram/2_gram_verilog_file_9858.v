// Seed: 2055193214
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output wand id_2,
    output wor  id_3,
    input  wand id_4,
    input  tri0 id_5,
    input  wire id_6,
    input  wor  id_7,
    input  tri0 id_8
);
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1
    , id_13,
    input wand id_2,
    input tri id_3,
    input supply0 id_4,
    output uwire id_5,
    output uwire id_6
    , id_14,
    output wire id_7,
    input uwire id_8,
    input uwire id_9,
    input tri id_10,
    input wire id_11
);
  always_ff begin : LABEL_0
    id_13 = 1;
  end
  assign id_7 = id_4;
  always @(*)
    @(posedge 1'b0)
      @(posedge id_13 or posedge 1)
        if (id_9) begin : LABEL_0
          id_6 = id_13;
        end else begin : LABEL_0
          id_13 = id_13 * 1'b0;
        end
  module_0 modCall_1 (
      id_6,
      id_13,
      id_6,
      id_7,
      id_9,
      id_9,
      id_14,
      id_14,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
