// Seed: 1935773060
module module_0 (
    input uwire id_0
    , id_7,
    input supply1 id_1,
    input tri0 id_2,
    output wor id_3,
    input tri1 id_4,
    input tri0 id_5
);
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_21 = 32'd37,
    parameter id_22 = 32'd35
) (
    output wire id_0
    , id_17,
    output wor id_1,
    output wor id_2,
    output tri1 id_3,
    output tri0 id_4,
    output wand id_5,
    input wand id_6,
    input tri id_7,
    output uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    input wand id_11,
    output logic id_12,
    input tri0 id_13,
    output supply1 id_14,
    input wand id_15
);
  logic [7:0] id_18;
  logic id_19;
  ;
  wire id_20;
  always_ff id_12 = #1 -1;
  logic _id_21;
  ;
  wire _id_22;
  ;
  wire [id_22 : id_21] id_23;
  wire id_24;
  wire id_25;
  ;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_13,
      id_3,
      id_11,
      id_11
  );
  assign modCall_1.id_0 = 0;
  localparam id_26 = "";
  assign id_20 = id_10;
  assign id_4  = (id_22);
  wire id_27;
  always @(negedge id_19) begin : LABEL_0
    id_18[1] <= id_15;
  end
endmodule
