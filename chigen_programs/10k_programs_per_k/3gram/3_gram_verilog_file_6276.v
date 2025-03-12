// Seed: 2763205436
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3
);
  logic id_5 = -1'b0;
  always @(-1'b0, posedge id_2)
    if (1) begin : LABEL_0
      id_5 = 1'h0;
      id_5 <= id_3;
      id_5 <= id_2;
    end
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    output tri id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    output supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    input wand id_9
);
  assign id_1 = 1;
  logic [1 : 1] id_11 = id_0;
  wire [-1  ||  1 : -1] id_12;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_8,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
