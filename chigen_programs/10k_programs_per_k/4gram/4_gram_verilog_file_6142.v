// Seed: 3989598023
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri id_4,
    input uwire id_5,
    output supply1 id_6,
    input supply1 id_7
);
  assign id_6 = 1;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd62,
    parameter id_16 = 32'd70,
    parameter id_17 = 32'd96,
    parameter id_18 = 32'd81,
    parameter id_9  = 32'd5
) (
    output wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6
    , _id_16,
    input wire id_7,
    output tri0 id_8,
    input wor _id_9,
    input wire id_10,
    input tri0 _id_11,
    input wor id_12,
    input supply1 id_13,
    input wire id_14
    , _id_17
);
  logic _id_18 = -1 * id_10 - -1;
  assign id_8 = id_10;
  logic id_19;
  ;
  struct packed {
    logic [(  id_18  ) : 1] id_20;
    logic [id_17 : 1] id_21;
  } [id_17 : id_9] id_22[-1 : 1] =
  id_22.id_20++;
  logic [-1  ^  id_11 : id_16] id_23;
  ;
  always @(posedge id_3 or posedge id_1) id_22 <= 1;
  assign id_23 = 1;
  initial assert (-1);
  module_0 modCall_1 (
      id_0,
      id_12,
      id_5,
      id_3,
      id_8,
      id_14,
      id_8,
      id_10
  );
  logic [-1 'b0 : -1] id_24;
  assign id_17 = id_4;
endmodule
