// Seed: 22616056
module module_0 (
    input tri id_0,
    input wand id_1,
    output wire id_2,
    input uwire id_3,
    output uwire id_4,
    input wor id_5,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    output supply0 id_9
    , id_16,
    input supply1 id_10,
    input wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    output supply1 id_14
);
  always @(posedge id_11 or posedge 1) $signed(6);
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd43,
    parameter id_13 = 32'd46,
    parameter id_2  = 32'd68,
    parameter id_4  = 32'd40,
    parameter id_8  = 32'd22
) (
    output tri1 id_0,
    input supply1 _id_1,
    output uwire _id_2,
    output tri1 id_3,
    input uwire _id_4,
    input supply1 id_5,
    input tri id_6,
    output wand id_7,
    input wor _id_8,
    output logic id_9,
    output logic id_10,
    input wor id_11,
    input wand id_12,
    input wor _id_13,
    input supply0 id_14
);
  wand [id_8 : id_1] id_16 = -1;
  module_0 modCall_1 (
      id_12,
      id_6,
      id_0,
      id_6,
      id_7,
      id_12,
      id_11,
      id_7,
      id_0,
      id_7,
      id_11,
      id_11,
      id_5,
      id_14,
      id_7
  );
  genvar id_17;
  assign id_3 = -1;
  struct packed {
    logic [id_4 : 1] id_18;
    logic [-1  -  1 : id_2] id_19;
  } [id_13 : -1] id_20;
  ;
  wor   id_21 = 1;
  reg   id_22;
  uwire id_23 = -1;
  initial begin : LABEL_0
    id_22 = new[id_6];
    id_17 = id_20.id_19;
    id_9  <= -1;
    id_10 <= 1 ^ id_20.id_18 == id_12;
  end
endmodule
