// Seed: 3430070693
module module_0 (
    output wor id_0,
    output wand id_1,
    input wand id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wor id_6,
    input wire id_7,
    output tri0 id_8,
    output tri id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wire id_12,
    input wire id_13,
    input supply0 id_14,
    input wand id_15,
    input wire id_16,
    input supply0 id_17,
    output wor id_18,
    input supply1 id_19,
    input supply1 id_20,
    output uwire id_21
);
  localparam id_23 = 1;
  logic id_24;
  assign id_9 = id_15;
endmodule
module module_1 #(
    parameter id_13 = 32'd73,
    parameter id_20 = 32'd21,
    parameter id_30 = 32'd19
) (
    input tri id_0,
    input uwire id_1,
    input wire id_2,
    output tri1 id_3,
    output tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input uwire id_7,
    output supply1 id_8,
    output supply0 id_9,
    output supply1 id_10,
    output supply1 id_11,
    input supply1 id_12,
    input supply0 _id_13,
    input supply0 id_14,
    output wor id_15,
    input wire id_16,
    input supply1 id_17,
    output wor id_18,
    input tri0 id_19,
    input uwire _id_20,
    input wand id_21,
    input tri1 id_22,
    output supply0 id_23
);
  assign id_3 = -1 + (id_13) - id_6;
  wire [id_13 : 1] id_25;
  wire id_26;
  logic id_27 = 1'b0;
  tri0 id_28;
  parameter id_29 = {1, -1};
  module_0 modCall_1 (
      id_18,
      id_11,
      id_6,
      id_11,
      id_12,
      id_2,
      id_11,
      id_2,
      id_10,
      id_10,
      id_22,
      id_23,
      id_1,
      id_21,
      id_21,
      id_21,
      id_6,
      id_0,
      id_15,
      id_19,
      id_0,
      id_18
  );
  assign modCall_1.id_14 = 0;
  logic _id_30;
  ;
  wire [-1 : id_20] id_31;
  logic id_32;
  assign id_28 = -1;
  reg id_33;
  ;
  parameter id_34 = id_29[~id_30];
  always @(negedge id_32) begin : LABEL_0
    if (-1) disable id_35;
    else begin : LABEL_1
      id_35 = -1;
      id_9 += id_30;
      wait (id_5);
      $clog2(71);
      ;
      id_33 <= 1'b0;
    end
  end
  wire id_36;
endmodule
