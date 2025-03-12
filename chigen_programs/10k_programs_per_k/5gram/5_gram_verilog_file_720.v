// Seed: 2889347680
module module_0 (
    input wire id_0,
    input tri0 id_1,
    output wire id_2,
    input wand id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input tri1 id_7
);
  uwire id_9 = 1;
  integer [-1  ==  -1 : 1] id_10;
endmodule
module module_1 #(
    parameter id_4 = 32'd71
) (
    input tri1 id_0,
    input wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    input tri1 _id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7
);
  assign id_2 = ~id_7;
  for (genvar id_9 = -1; id_6; id_9 = -1'b0) begin : LABEL_0
    assign id_9 = id_2++;
    if (1) begin : LABEL_1
      wire [id_4 : 1] id_10;
      tri1 id_11 = 1;
    end else logic id_12;
  end
  or primCall (id_2, id_0, id_5, id_1, id_9);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_3,
      id_0,
      id_7,
      id_5,
      id_6,
      id_7
  );
endmodule
