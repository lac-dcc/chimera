// Seed: 2651218091
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input wire id_4,
    input wor id_5,
    output wor id_6,
    output wor void id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri id_12,
    input tri id_13,
    input supply1 id_14,
    input wire id_15,
    output supply0 id_16
);
  supply1 id_18 = 1;
  wand id_19 = id_13, id_20;
  assign id_7 = 1'b0;
  always_ff #1 begin
    if (~id_20)
      if (id_14) begin
        if (1'd0 & id_11) id_6 = 1;
      end else $display;
    else if (1) $display;
    else
      case (id_0 - id_3)
        id_18: id_18 = id_0;
        id_11: $display(1);
      endcase
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output wire id_2,
    input tri1 id_3,
    input tri id_4,
    output wand id_5,
    input supply0 id_6,
    input wand id_7
);
  wire id_9;
  wire id_10;
  module_0(
      id_6,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_2,
      id_5,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_3,
      id_5
  );
endmodule
