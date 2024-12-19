// Seed: 2459996788
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3[1'b0] = id_2 ? id_7 : 1'b0;
  uwire id_8 = id_4;
  always @(*) begin : LABEL_0
    if (id_2) #0 id_8 = id_5 == 1;
  end
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9
  );
  supply1 id_10 = id_5;
  assign id_8 = 1;
endmodule
