// Seed: 736813076
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output supply1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    output wand id_7,
    input tri id_8,
    input supply0 id_9,
    output wor id_10,
    output wire id_11,
    input supply0 id_12,
    input wor id_13,
    output tri0 id_14,
    input tri1 id_15,
    input tri0 id_16,
    input wire id_17,
    output wor id_18,
    input wire id_19,
    input wor id_20,
    output tri0 id_21
);
endmodule
module module_1 #(
    parameter id_25 = 32'd46,
    parameter id_26 = 32'd68
) (
    input tri1 id_0,
    input supply1 id_1,
    output wand id_2,
    inout wand id_3,
    input uwire id_4,
    output logic id_5,
    input tri1 id_6,
    output uwire id_7,
    input supply1 id_8,
    output wor id_9,
    input tri id_10,
    input wor id_11,
    output logic id_12,
    input tri0 id_13,
    input logic id_14,
    input wor id_15,
    input supply0 id_16,
    input wand id_17,
    input wor id_18,
    input tri id_19,
    output uwire id_20
);
  supply0 id_22;
  supply0 id_23 = 1;
  always
    if (id_6) id_12 <= id_14;
    else if (1)
      if (id_13)
        if (1 == id_11) id_9 = 1;
        else for (id_23 = 1; 1 - ""; ++id_7) id_12 = 1'h0;
      else id_5 <= 1;
    else begin : LABEL_0$display
      ;
    end
  wire id_24;
  initial begin : LABEL_0
    id_22 = (id_1);
    if (id_10) begin : LABEL_0
      id_12 = 1'b0;
    end
  end
  defparam id_25.id_26 = 1;
  xnor primCall (
      id_12,
      id_15,
      id_4,
      id_3,
      id_8,
      id_24,
      id_10,
      id_23,
      id_14,
      id_25,
      id_17,
      id_0,
      id_16,
      id_6,
      id_26,
      id_18,
      id_19,
      id_11,
      id_13,
      id_22,
      id_1
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_7,
      id_22,
      id_8,
      id_18,
      id_20,
      id_9,
      id_17,
      id_0,
      id_20,
      id_7,
      id_8,
      id_16,
      id_20,
      id_4,
      id_19,
      id_11,
      id_20,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_11 = 0;
endmodule
