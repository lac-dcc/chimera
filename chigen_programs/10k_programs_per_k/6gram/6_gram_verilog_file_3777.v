// Seed: 2791079833
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  assign module_1.id_27 = 0;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_6;
  ;
endmodule
module module_1 #(
    parameter id_27 = 32'd93,
    parameter id_32 = 32'd56,
    parameter id_6  = 32'd11
) (
    output wire id_0,
    output uwire id_1,
    output supply1 id_2,
    input supply1 id_3
    , id_29,
    output wor id_4,
    input wire id_5,
    input supply1 _id_6,
    input wor id_7,
    input tri0 id_8,
    output uwire id_9,
    input wand id_10,
    inout supply0 id_11,
    output supply0 id_12,
    output uwire id_13,
    input tri id_14,
    output tri id_15,
    input tri0 id_16,
    input tri1 id_17,
    output tri0 id_18,
    output tri0 id_19,
    input supply1 id_20,
    input supply0 id_21,
    input supply1 id_22,
    input tri0 id_23,
    input wire id_24,
    input wire id_25,
    output wor id_26,
    input wand _id_27
);
  wire id_30;
  logic [7:0] id_31;
  assign id_29 = 1'd0;
  parameter id_32 = 1 ~^ 1;
  wire id_33;
  integer [-1 : 'd0] id_34, id_35;
  assign id_2 = id_17;
  always @(posedge 1) begin : LABEL_0
    $unsigned(id_32);
    ;
  end
  localparam id_36 = id_32;
  wire id_37;
  module_0 modCall_1 (
      id_35,
      id_29,
      id_34,
      id_34,
      id_37
  );
  assign id_29 = 1;
  assign id_31[id_6>>id_27 :-1&id_32] = id_20 - -1;
endmodule
