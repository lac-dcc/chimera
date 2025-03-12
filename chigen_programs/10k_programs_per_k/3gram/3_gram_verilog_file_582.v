// Seed: 3523313307
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input tri1 id_2
    , id_13, id_14,
    input tri id_3,
    output uwire id_4,
    input supply1 id_5,
    input supply1 id_6,
    output uwire id_7,
    output tri1 id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11
);
  assign id_13 = -1 == (id_10);
  assign module_1.id_14 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd54,
    parameter id_11 = 32'd30,
    parameter id_12 = 32'd98,
    parameter id_14 = 32'd25,
    parameter id_15 = 32'd81,
    parameter id_19 = 32'd16,
    parameter id_3  = 32'd16,
    parameter id_8  = 32'd2
) (
    input tri1 id_0,
    input wire _id_1
    , _id_19,
    input tri1 id_2,
    input wor _id_3,
    input uwire id_4,
    input supply1 id_5,
    input wand id_6,
    input tri id_7,
    input tri1 _id_8,
    input tri1 id_9,
    output logic id_10,
    input wand _id_11,
    input wire _id_12,
    output tri1 id_13,
    input wire _id_14,
    input tri1 _id_15,
    output supply0 id_16,
    input tri0 id_17
);
  supply0 [id_11 : ~  id_1] id_20 = 1'd0;
  module_0 modCall_1 (
      id_13,
      id_0,
      id_7,
      id_4,
      id_16,
      id_4,
      id_4,
      id_13,
      id_16,
      id_0,
      id_0,
      id_5
  );
  logic id_21 = id_8;
  wire [id_3 : id_15] id_22 = id_7;
  uwire id_23 = 1'd0;
  wire [-  id_8 : -1] id_24 = -1;
  logic [(  1  ) : id_12] id_25[id_19 : 1  -  (  id_14  )];
  always @(1 or posedge -1) begin : LABEL_0
    id_10 <= -1;
  end
  tri1 id_26 = 1'b0;
endmodule
