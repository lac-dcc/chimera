// Seed: 3987029521
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input wire id_2,
    output uwire id_3,
    output tri id_4,
    input supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8
);
  generate
    if (1) begin : LABEL_0
      struct packed {
        id_10 id_11;
        id_12 id_13;
      }
          id_14, id_15;
    end
  endgenerate
  wire id_16;
  assign id_3 = id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd20
) (
    output wand id_0,
    output wand _id_1,
    input uwire id_2,
    input wire id_3,
    output wand id_4,
    input wire id_5,
    input uwire id_6,
    input supply0 id_7,
    output uwire id_8,
    input wor id_9,
    output supply0 id_10
);
  wire id_12;
  assign id_8 = id_7;
  or primCall (id_4, id_3, id_9, id_2, id_7, id_14, id_5);
  logic [1 : id_1] id_13;
  ;
  logic id_14;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_4,
      id_8,
      id_9,
      id_7,
      id_9,
      id_6
  );
endmodule
