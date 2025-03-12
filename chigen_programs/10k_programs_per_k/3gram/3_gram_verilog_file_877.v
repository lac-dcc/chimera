// Seed: 1798397903
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input tri0 id_2,
    output tri id_3,
    input wand id_4,
    output uwire id_5
);
  if (~1) begin : LABEL_0
    if (1) begin : LABEL_1
      assign id_3 = 1;
    end else begin : LABEL_2
      pullup (
          id_3,
          id_1++,
          1 == id_2,
          id_5 | id_4 + -1,
          {id_1 + 1{id_0}},
          id_1,
          1 ** 1'b0,
          id_0,
          id_5,
          id_2
      );
    end
  end
endmodule
module module_1 #(
    parameter id_13 = 32'd15,
    parameter id_19 = 32'd49
) (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input supply0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    output tri id_9,
    output tri1 id_10,
    input wand id_11,
    input wand id_12,
    input uwire _id_13,
    output wor id_14,
    input tri1 id_15,
    input supply1 id_16,
    input tri1 id_17,
    input wire id_18,
    input wire _id_19,
    input tri id_20
);
  integer [-1 : id_13] id_22, id_23;
  always @(negedge 1);
  assign id_14 = 1;
  assign id_9  = id_19;
  wire [1 : id_19] id_24;
  module_0 modCall_1 (
      id_9,
      id_17,
      id_1,
      id_8,
      id_15,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
