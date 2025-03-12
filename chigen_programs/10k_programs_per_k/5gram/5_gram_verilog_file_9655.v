// Seed: 161970174
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    output wand id_4,
    input tri1 module_0
);
endmodule
module module_1 #(
    parameter id_0  = 32'd19,
    parameter id_10 = 32'd99,
    parameter id_20 = 32'd21,
    parameter id_4  = 32'd4,
    parameter id_9  = 32'd39
) (
    input supply0 _id_0,
    output wire id_1,
    input tri1 id_2,
    output logic id_3,
    output supply1 _id_4,
    output supply0 id_5,
    input uwire id_6,
    input wand id_7,
    output wor id_8,
    input tri0 _id_9
    , id_19,
    input wand _id_10,
    input wand id_11,
    input uwire id_12,
    input tri0 id_13,
    input wor id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri0 id_17
);
  wire [id_9 : -1] _id_20;
  bit id_21;
  module_0 modCall_1 (
      id_16,
      id_8,
      id_1,
      id_12,
      id_8,
      id_2
  );
  struct packed {
    logic [id_20 : -1] id_22;
    struct packed {
      id_23 id_24;
      logic [id_0  &&  -1  &&  id_4  &&  id_10 : 1] id_25;
    } id_26;
  } id_27;
  assign id_27.id_22 = 1'b0;
  assign id_3 = -1;
  assign id_27.id_25 = 1;
  always @(id_27)
    if (-1'h0) begin : LABEL_0
      id_21 = 1'h0;
    end
  always @(id_9) begin : LABEL_1
    id_3 <= $realtime;
    id_27.id_26 <= id_2;
  end
endmodule
