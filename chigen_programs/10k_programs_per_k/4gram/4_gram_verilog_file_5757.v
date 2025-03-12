// Seed: 281941338
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  assign module_1.id_10 = 0;
  input wire id_1;
  integer id_14;
  ;
  always @(posedge id_8) $unsigned(22);
  ;
  always @(posedge id_5)
    @(id_12 or negedge id_3) begin : LABEL_0
      id_14 = id_9;
    end
  wire id_15;
endmodule
module module_1 #(
    parameter id_5 = 32'd72
) (
    input wire id_0,
    output uwire id_1
    , id_16,
    output supply0 id_2,
    inout supply1 id_3,
    input tri id_4,
    input tri _id_5,
    input supply1 id_6,
    input wand id_7,
    input wire id_8,
    output wor id_9,
    input uwire id_10,
    input wire id_11,
    input tri1 id_12,
    input tri1 id_13,
    output tri1 id_14
);
  assign id_1 = id_6;
  and primCall (id_2, id_8, id_6, id_12, id_13, id_4, id_11, id_0, id_3, id_16);
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
  wire [~  id_5 : 1] id_17;
endmodule
