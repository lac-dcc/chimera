// Seed: 2005805285
module module_0;
  supply1 id_1 = id_1;
  wand id_2 = 1'd0;
  assign id_1 = id_2;
  wire id_3, id_4;
  initial begin : LABEL_0
    id_1 = 1;
    if (id_1) begin : LABEL_0
      cover ("");
      wait (1);
    end
  end
endmodule
module module_1 #(
    parameter id_27 = 32'd35,
    parameter id_28 = 32'd48
) (
    output supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input uwire id_7,
    output tri id_8,
    output tri1 id_9,
    input tri id_10,
    input supply0 id_11,
    input tri1 id_12,
    output supply0 id_13,
    input supply1 id_14,
    output logic id_15,
    input uwire id_16
);
  wire id_18;
  wire id_19;
  wire id_20;
  always @* begin : LABEL_0
    id_15 = #1 1 - 1'b0;
    id_15 = 1;
  end
  wire id_21;
  wire id_22;
  wire id_23;
  wire id_24;
  module_0 modCall_1 ();
  wire id_25;
  wire id_26;
  defparam id_27.id_28 = id_23;
  and primCall (
      id_0,
      id_1,
      id_10,
      id_11,
      id_12,
      id_14,
      id_16,
      id_18,
      id_19,
      id_2,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_3,
      id_4,
      id_7
  );
endmodule
