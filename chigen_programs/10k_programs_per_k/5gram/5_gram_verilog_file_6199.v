// Seed: 3595568757
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  tri0 id_3 = (1 ? id_2 : (1));
  assign module_1.id_9 = 0;
  tri id_4 = 1'b0 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  tri0 id_7;
  module_0 modCall_1 (
      id_4,
      id_6
  );
  reg id_8, id_9, id_10 = 1;
  wire id_11;
  always_ff @(posedge id_11) begin : LABEL_0
    if (id_3[1'b0]) begin : LABEL_0
      if (1) id_2 <= id_9;
    end
  end
  assign id_7 = 1;
  wire id_12;
  wire id_13;
  always_latch disable id_14;
  wire id_15;
endmodule
