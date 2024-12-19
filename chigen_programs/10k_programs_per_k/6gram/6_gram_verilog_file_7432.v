// Seed: 1196392280
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output wand id_2,
    output tri id_3,
    input tri id_4,
    input wor id_5,
    output uwire id_6
);
  generate
    for (id_8 = id_5; id_4; id_6 = id_5) begin : LABEL_0
      always @(id_0) begin : LABEL_0
        wait (id_0);
      end
    end
  endgenerate
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output tri0  id_3
);
  wire id_5;
  specify
    (id_6 => id_7) = (id_7, id_0  : 1'd0 : 1);
    (id_8 => id_9) = (id_2  : {1 ^ 1, 1} : 1, 1);
    (id_10 *> id_11) = (id_7  : 1  : 1, 1 == 1);
    (id_12 => id_13) = (id_11  : id_0  : 1 * 1 + id_2, 1'd0 : 1  : id_8);
    (id_14 => id_15) = 0;
    (id_16 => id_17) = 1;
  endspecify
  always @(id_7 or 1'b0 or id_2, 1 or posedge id_17) id_12 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_16,
      id_1,
      id_14,
      id_8
  );
endmodule
