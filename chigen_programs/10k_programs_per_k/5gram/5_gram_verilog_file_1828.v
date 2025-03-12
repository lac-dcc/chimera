// Seed: 60361771
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output wand id_2,
    input wire id_3,
    input wor id_4,
    input tri id_5,
    input supply0 id_6,
    output wor id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    input uwire id_11,
    input supply0 id_12,
    input tri id_13
);
  generate
    always @(posedge id_9 or posedge id_8 & 1'b0) begin : LABEL_0
      disable id_15;
    end
  endgenerate
  parameter id_16 = 1 & 1;
  assign id_1 = 1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_7 = 32'd85
) (
    input wire id_0,
    output uwire id_1,
    input tri id_2,
    output supply1 id_3,
    output tri id_4,
    input tri0 id_5,
    input tri id_6,
    output tri1 _id_7,
    output uwire id_8
);
  logic [-1  !=  (  -1  ) : id_7] id_10;
  wire id_11;
  wire id_12;
  logic id_13;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_8,
      id_6,
      id_0,
      id_5,
      id_2,
      id_8,
      id_5,
      id_0,
      id_0,
      id_0,
      id_6,
      id_5
  );
endmodule
