// Seed: 2710487411
module module_0 (
    output tri id_0,
    output wor id_1,
    input wor id_2,
    input supply0 id_3,
    output tri id_4
);
  wire id_6;
  assign id_1 = 1;
  wire id_7;
endmodule
module module_0 (
    output tri   id_0,
    output tri0  id_1,
    input  tri1  id_2,
    output tri0  module_1,
    output logic id_4,
    output tri0  id_5,
    output tri   id_6
);
  wire  id_8;
  logic id_9;
  uwire id_10;
  reg   id_11;
  uwire id_12;
  initial begin : LABEL_0
    id_6 = id_12;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_2,
      id_12,
      id_6
  );
  assign modCall_1.id_2 = 0;
  wire id_13;
  always @(posedge id_10 ^ 1'b0)
    if (1'b0) begin : LABEL_0
      #1 id_10 = 1'h0 / id_12;
    end else
      #1 begin : LABEL_0
        id_9 <= id_11 ? id_11 : 1;
      end
  assign id_4 = id_9;
  wire id_14;
  wire id_15;
  supply1 id_16 = id_12 - id_9;
endmodule
