// Seed: 145509680
module module_0 ();
  always disable id_1;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wire id_3,
    input wand id_4,
    input tri id_5,
    output uwire id_6,
    inout wand id_7,
    inout supply1 id_8
);
  always @(id_5 - 1'b0 or id_5) begin : LABEL_0
    $unsigned(99);
    ;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output logic id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6
    , id_17,
    input uwire id_7,
    input wand id_8,
    input tri1 id_9,
    input wor id_10,
    input uwire id_11,
    output supply1 id_12,
    input tri id_13,
    input wor id_14,
    output logic id_15
);
  always @* begin : LABEL_0
    if (1) begin : LABEL_1
      id_0  = id_10;
      id_15 = #id_18 1;
    end else
      case (1)
        -1: begin : LABEL_2
          id_15 <= -1'b0;
        end
        id_5: id_17 = id_1;
        id_7: id_15 <= 1'd0;
        default: id_0 <= id_6;
      endcase
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
