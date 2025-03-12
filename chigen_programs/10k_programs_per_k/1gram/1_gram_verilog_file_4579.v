// Seed: 2135185371
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    input wire id_3,
    input wire id_4,
    output supply0 id_5,
    input wand id_6,
    input tri1 id_7#(
        .id_11(1),
        .id_12(-1),
        .id_13(-1)
    ),
    output tri0 id_8,
    output uwire id_9
    , id_14
);
  wire  id_15;
  logic id_16;
  id_17 :
  assert property (@(1'b0 or posedge -1 or id_11 or id_4) "" - -1) begin : LABEL_0
    begin : LABEL_1
      id_17 = -1;
    end
  end
  pullup (
      .id_0(-1'd0 || id_1),
      .id_1(-1),
      .id_2(-1 == -1'b0),
      .id_3(-1),
      .id_4(id_14),
      .id_5(id_16),
      .id_6(-1'b0 | {1'b0{id_4, (-1)}}),
      .id_7(-1),
      .id_8(-1 ? -1 : id_0),
      .id_9(-1'b0),
      .id_10(id_7)
  );
  assign id_11 = id_17;
endmodule
module module_1 #(
    parameter id_12 = 32'd25,
    parameter id_13 = 32'd84,
    parameter id_7  = 32'd28
) (
    output wire id_0,
    input tri id_1,
    input tri0 id_2#(.id_17(1)),
    output supply0 id_3[1 : id_13],
    input wand id_4,
    input tri1 id_5[id_12  .  id_7 : -1],
    input tri0 id_6,
    input wire _id_7,
    input supply1 id_8,
    output uwire id_9,
    output wand id_10,
    output tri0 id_11,
    input supply1 _id_12,
    output uwire _id_13,
    input tri id_14,
    input wire id_15
);
  wire id_18;
  ;
  wire [~|  1  ==  -1 : 1 'b0] id_19, id_20;
  wire id_21;
  wire id_22;
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_15,
      id_5,
      id_10,
      id_5,
      id_14,
      id_9,
      id_9
  );
  logic id_24;
  id_25(
      id_14
  );
  wire id_26;
endmodule
