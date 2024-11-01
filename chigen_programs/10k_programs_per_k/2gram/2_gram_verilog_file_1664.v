// Seed: 3208757065
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input tri id_3,
    input logic id_4,
    input tri0 id_5,
    input logic id_6,
    output supply1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input wor id_10,
    output wor id_11
);
  assign id_7 = 1'b0;
  generate
    assign id_1 = 1;
  endgenerate
  always_ff {id_6, 1, id_4} <= 1;
  assign id_1 = id_0;
  assign {id_9, id_0} = id_5;
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    input tri id_5,
    output wire id_6,
    input uwire id_7,
    input wor id_8,
    input tri1 id_9,
    input tri id_10,
    output uwire id_11,
    output supply0 id_12,
    output wire id_13,
    output logic id_14,
    output logic id_15,
    input wor id_16,
    input supply1 id_17,
    input logic id_18,
    output supply0 id_19,
    output supply1 id_20,
    input logic id_21,
    output logic id_22,
    input supply1 id_23,
    input wire id_24,
    input wand id_25,
    output logic id_26,
    output tri id_27,
    output supply1 id_28
);
  nor (
      id_13,
      id_8,
      id_18,
      id_16,
      id_25,
      id_17,
      id_5,
      id_23,
      id_24,
      id_9,
      id_3,
      id_10,
      id_2,
      id_21,
      id_7
  );
  module_0(
      id_8, id_11, id_27, id_5, id_18, id_2, id_18, id_6, id_7, id_3, id_5, id_13
  );
  wor id_30;
  initial begin
    $display(1);
    id_26 <= 1;
    id_19 = id_25;
    id_22 <= id_18;
    if (id_3) begin
      if (id_17) id_14 <= id_21;
    end else $display(1, id_5, 1, id_5, id_16 == 1, id_30);
  end
  assign id_15 = id_18;
  wire id_31;
  wire id_32;
  assign id_32 = id_8 == 1;
endmodule
