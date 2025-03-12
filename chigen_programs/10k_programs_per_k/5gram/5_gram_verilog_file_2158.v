// Seed: 1196985048
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output uwire id_2,
    output uwire id_3,
    output uwire id_4,
    output tri id_5,
    input wire id_6,
    output wand id_7,
    output wire id_8,
    output supply0 id_9,
    input wand id_10,
    input tri id_11,
    input wand id_12,
    input tri1 id_13,
    output wire id_14,
    output uwire id_15,
    output supply0 id_16,
    output tri0 id_17
);
  wire id_19;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd52
) (
    input tri id_0,
    input tri id_1,
    output wire id_2,
    input wire id_3,
    output supply0 id_4,
    output wire id_5,
    output uwire _id_6
);
  for (id_8 = id_1; 1'b0; id_8 = ~id_1) begin : LABEL_0
    if (-1) begin : LABEL_1
      assign id_4 = id_8;
    end
  end
  wire id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_2,
      id_4,
      id_2,
      id_0,
      id_5,
      id_2,
      id_5,
      id_3,
      id_0,
      id_0,
      id_1,
      id_2,
      id_5,
      id_5,
      id_5
  );
  logic [1 'd0 : id_6] id_11 = id_1;
endmodule
