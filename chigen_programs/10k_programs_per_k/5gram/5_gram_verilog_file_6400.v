// Seed: 539076677
module module_0 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    input wand id_3,
    output wire id_4
);
endmodule
module module_1 #(
    parameter id_22 = 32'd0,
    parameter id_23 = 32'd78
) (
    output tri1 id_0,
    input uwire id_1,
    output logic id_2,
    output supply0 id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    input wand id_7,
    inout tri id_8,
    output uwire id_9,
    output supply1 id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    output supply1 id_14,
    output wire id_15,
    output supply1 id_16
);
  wire id_18;
  assign id_15 = id_13;
  id_19(
      .sum(1'b0), .id_0(id_12), .id_1(1'd0), .id_2(id_11), .id_3(!id_4), .id_4(id_13)
  );
  xnor (
      id_16,
      id_12,
      id_6,
      id_23,
      id_11,
      id_22,
      id_18,
      id_5,
      id_24,
      id_20,
      id_21,
      id_13,
      id_8,
      id_4,
      id_1,
      id_7,
      id_19
  );
  assign id_0 = id_4 ? id_1 : id_7;
  id_20(
      1, id_6, id_0
  );
  wire id_21;
  defparam id_22.id_23 = 1;
  genvar id_24;
  generate
    always @(id_24 or id_19) begin
      id_2 <= 1;
    end
  endgenerate
  module_0(
      id_14, id_4, id_13, id_13, id_16
  );
endmodule
