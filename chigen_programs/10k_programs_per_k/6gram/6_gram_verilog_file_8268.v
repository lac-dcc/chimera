// Seed: 1453742584
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wand id_2,
    output supply1 id_3
);
  wand id_5;
  assign module_1.id_14 = 0;
  assign id_5 = 1'b0;
endmodule
module module_1 #(
    parameter id_13 = 32'd96,
    parameter id_6  = 32'd23
) (
    input tri0 id_0,
    output supply0 id_1,
    output logic id_2,
    output wor id_3,
    output tri0 id_4,
    output wand id_5,
    input uwire _id_6,
    input supply1 id_7,
    input tri id_8,
    input supply1 id_9,
    input tri id_10,
    input supply0 id_11,
    output uwire id_12,
    input tri0 _id_13,
    output tri id_14
);
  always @(posedge id_9) begin : LABEL_0
    if (1)
      #1 begin : LABEL_1
        id_2 <= id_0;
      end
  end
  reg [id_13 : id_6] id_16;
  always id_16 = #1 id_6;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_0,
      id_12
  );
  assign id_4 = -(id_13 ? id_8 : 1) ? -1'b0 : 1;
endmodule
