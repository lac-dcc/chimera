// Seed: 3399208531
module module_0 #(
    parameter id_1 = 32'd19,
    parameter id_4 = 32'd40
);
  wire _id_1;
  ;
  wire [id_1 : 1] id_2, id_3, _id_4, id_5;
  union packed {
    struct packed {
      logic [-1 : 1] id_6;
      logic [id_4 : id_4] id_7;
    } [id_4 : id_4] id_8;
    id_9 id_10;
  } [-1 'b0 : id_1] id_11 = id_3;
  assign module_1.id_23 = 0;
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2
    , id_21,
    input tri1 id_3,
    input wand id_4,
    output tri0 id_5
    , id_22,
    input wand id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri id_10,
    output wire id_11,
    input uwire id_12,
    input wand id_13,
    output tri0 id_14,
    output tri0 id_15,
    output tri0 id_16,
    input tri id_17
    , id_23,
    input wire id_18,
    output uwire id_19
);
  always @(*)
    if (1) begin : LABEL_0
      id_23 <= ~id_3;
    end else id_22 <= id_2;
  module_0 modCall_1 ();
endmodule
