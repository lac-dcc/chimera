// Seed: 656822560
module module_0 (
    input  tri0  id_0,
    output logic id_1
);
  generate
    initial
      if (1) for (id_1 = id_0; 1; id_1 = 1) id_1 = id_0;
      else id_1 <= 1'd0;
    for (id_3 = id_0; id_3; id_1 = id_0(1)) begin : LABEL_0
      always @(id_0 or 1)
        if (~1) begin : LABEL_1
          assert (1);
        end else if (1)
          for (id_3 = -1'b0 - 1; id_3; id_3 = id_0)
            #id_4 begin : LABEL_2
              id_3 <= id_4;
              if (1 && 1) id_4 <= -1'b0;
            end
    end
  endgenerate
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    output wand id_3,
    input supply1 id_4,
    input uwire id_5,
    input supply0 id_6,
    output supply0 id_7,
    input wire id_8,
    output tri0 id_9,
    output supply0 id_10,
    output tri0 id_11,
    output wor id_12,
    output tri0 id_13,
    output wand id_14,
    input wand id_15,
    output wire id_16,
    input wand id_17,
    input uwire id_18,
    input uwire id_19,
    input wand id_20,
    output logic id_21,
    input tri id_22,
    output supply0 id_23
);
  logic id_25 = 1;
  module_0 modCall_1 (
      id_20,
      id_21
  );
  assign modCall_1.id_4 = 0;
  initial begin : LABEL_0
    $signed(93);
    ;
    id_25 <= id_15;
    id_21 = id_15;
  end
endmodule
