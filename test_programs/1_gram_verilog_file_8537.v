// Seed: 4074498754
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_5, id_6 = id_5;
  id_7(
      id_4 && id_2 & 1, id_3, -1
  );
  if (id_5) assign id_2 = id_3;
  else assign id_6 = -1;
  always_comb begin : LABEL_0
    #1;
    id_5 <= -1;
  end
  initial $display();
  wire id_8, id_9;
  localparam id_10 = id_10;
  assign id_6 = -1;
endmodule
module module_1;
  wire id_1;
  assign id_2 = 1'b0;
  wire id_3, id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
