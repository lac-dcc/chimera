// Seed: 2826607920
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output wand id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    input uwire id_6,
    input uwire id_7,
    output tri id_8,
    output supply0 id_9,
    output supply0 id_10,
    input supply1 id_11,
    output supply0 id_12,
    input tri0 id_13,
    input tri id_14,
    output supply0 id_15,
    input tri0 id_16,
    output wor id_17,
    input tri id_18,
    input tri id_19,
    input supply1 id_20,
    output tri id_21
    , id_41,
    input tri1 id_22,
    input tri id_23,
    output wire id_24,
    output tri1 id_25,
    output uwire id_26,
    input tri0 id_27,
    input tri1 id_28,
    output tri0 id_29,
    input tri0 id_30,
    input supply1 id_31,
    input tri0 id_32,
    input tri0 id_33,
    input wand id_34,
    output wand id_35,
    input tri0 id_36,
    input wire id_37,
    input supply0 id_38,
    output uwire id_39
);
  wire id_42;
endmodule
module module_1 (
    output tri0 id_0,
    input  wand id_1,
    output tri0 id_2,
    input  tri1 id_3,
    input  tri0 id_4,
    output tri0 id_5,
    input  wor  id_6,
    output tri  id_7,
    input  tri0 id_8,
    input  tri  id_9
);
  assign id_2 = 1'b0 & 1;
  module_0(
      id_1,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_7,
      id_0,
      id_3,
      id_2,
      id_1,
      id_9,
      id_7,
      id_8,
      id_2,
      id_4,
      id_8,
      id_4,
      id_2,
      id_1,
      id_4,
      id_0,
      id_5,
      id_0,
      id_1,
      id_3,
      id_5,
      id_9,
      id_8,
      id_9,
      id_8,
      id_9,
      id_2,
      id_6,
      id_9,
      id_8,
      id_0
  );
  wire id_11;
  generate
    for (id_12 = 1; id_6; id_7 = (id_4)) begin : id_13
      assign id_13 = id_1;
    end
  endgenerate
  always @(posedge id_8 or negedge id_9 != "") begin
    id_0 = {1 - id_3{1'b0}};
  end
endmodule
