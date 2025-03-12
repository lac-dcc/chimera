// Seed: 322600991
module module_0 (
    input wor id_0,
    input wire id_1,
    output wand id_2,
    input uwire id_3,
    output tri0 id_4,
    input wand id_5,
    output tri1 id_6,
    input wor id_7,
    input wor id_8,
    input tri0 id_9,
    output tri id_10,
    input tri id_11,
    input wor id_12,
    output supply0 id_13,
    input supply1 id_14,
    input tri1 id_15,
    input wand id_16,
    input supply0 id_17,
    input wire id_18,
    input wire id_19
    , id_24,
    input tri0 id_20,
    input wor id_21,
    output tri1 id_22
);
  always_latch @(id_11 & "" or posedge -1 * -1'd0 - 1 + id_0) begin : LABEL_0
    $unsigned(80);
    ;
    SystemTFIdentifier(~id_24);
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd7,
    parameter id_8 = 32'd72,
    parameter id_9 = 32'd91
) (
    input supply0 id_0,
    input uwire id_1,
    input wor id_2,
    input supply0 _id_3,
    output wire id_4,
    output wand id_5
);
  assign id_5 = id_3;
  reg id_7 = 1;
  assign id_4 = id_0;
  always @(posedge -1 or posedge -1) id_7 = id_2;
  assign id_4 = -1 == id_2;
  assign id_4 = id_3 !=? id_1;
  assign id_4 = id_7++;
  wire [id_3 : 1] _id_8;
  wire _id_9;
  wire [id_9  +  1 : ""] id_10;
  wire [id_8 : -1] id_11;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_0,
      id_5,
      id_2,
      id_4,
      id_0,
      id_0,
      id_0,
      id_5,
      id_0,
      id_1,
      id_5,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_5
  );
endmodule
