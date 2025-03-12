// Seed: 2733570621
module module_0 (
    output tri0 id_0,
    output wand id_1,
    input uwire id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply0 sample,
    output wire module_0,
    input wand id_10,
    output tri1 id_11,
    input uwire id_12,
    output tri0 id_13,
    output uwire id_14,
    output tri id_15,
    input supply0 id_16,
    input tri0 id_17,
    output wand id_18,
    output tri0 id_19,
    input tri1 id_20,
    input tri1 id_21
);
  id_23 :
  assert property (@(posedge &id_4) 1)
  else $signed(30);
  ;
  parameter id_24 = 1;
endmodule
module module_0 #(
    parameter id_13 = 32'd26,
    parameter id_15 = 32'd3
) (
    output tri1 id_0,
    input wor id_1,
    input tri1 id_2,
    output wand id_3,
    input supply0 id_4,
    input uwire module_1,
    input wire id_6,
    input supply0 id_7,
    output supply0 id_8,
    output wor id_9,
    input wire id_10,
    input tri id_11,
    input tri0 id_12,
    input tri _id_13,
    output tri0 id_14,
    input supply1 _id_15,
    output tri0 id_16,
    input wor id_17,
    input wire id_18
);
  logic id_20;
  ;
  logic   id_21 = -1;
  integer id_22;
  ;
  module_0 modCall_1 (
      id_3,
      id_14,
      id_6,
      id_4,
      id_1,
      id_6,
      id_2,
      id_11,
      id_17,
      id_8,
      id_7,
      id_14,
      id_10,
      id_14,
      id_3,
      id_9,
      id_18,
      id_7,
      id_3,
      id_8,
      id_6,
      id_18
  );
  assign modCall_1.id_0 = 0;
  wire id_23;
  assign id_14 = id_10 > id_18 - -1'b0 + 'd0 - -1;
  assign id_23 = id_18;
  parameter id_24 = 1'b0;
  wire id_25;
  ;
  wire [!  id_13 : id_15] id_26;
endmodule
