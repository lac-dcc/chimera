// Seed: 690042327
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3,
    input uwire id_4,
    output tri1 id_5
);
  wire [-1 'b0 : 1 'h0] id_7 = id_3, id_8 = 1, id_9 = ~id_9;
  assign id_9 = id_7;
  assign id_5 = id_2;
  always @(id_9 or posedge 1) begin : LABEL_0
    if (1) disable id_10;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd5
) (
    input wor id_0,
    input supply0 id_1,
    output logic id_2,
    input wand _id_3,
    output wand id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_0,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
  logic [7:0] id_7;
  assign id_7[id_3] = id_1 && 1'd0 && 1;
  initial begin : LABEL_0
    id_2 = #id_8 -1;
    if (-1)
      assume (id_0);
      else begin : LABEL_1
        id_2 <= id_7;
      end
  end
endmodule
