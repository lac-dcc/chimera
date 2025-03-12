// Seed: 618945763
module module_0 (
    output wor id_0,
    output wor id_1,
    input wire id_2,
    input wire id_3,
    input tri id_4,
    input wor id_5,
    input wand id_6,
    input wire id_7,
    input wor id_8,
    input supply0 id_9
    , id_15,
    input wire id_10,
    output wor id_11,
    output wand id_12,
    input wire id_13
);
  supply1 id_16 = -1;
  tri1 id_17;
  wire id_18;
  ;
  localparam id_19 = 1;
  if (1) begin : LABEL_0
    assign id_17 = -1'b0;
  end else begin : LABEL_1
    supply1 id_20 = 1;
    wire id_21 = id_17, id_22;
  end
endmodule
module module_1 #(
    parameter id_18 = 32'd67,
    parameter id_6  = 32'd29
) (
    input wire id_0,
    output logic id_1,
    input wire id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri id_5,
    input wand _id_6,
    output tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wand id_10,
    input wor id_11,
    input wire id_12,
    input wire id_13,
    input tri id_14,
    output tri id_15,
    input supply0 id_16,
    input uwire id_17,
    input uwire _id_18,
    input uwire id_19
);
  localparam id_21 = "";
  wire id_22;
  ;
  always @(posedge id_18) if (id_21) id_1 <= id_13 && id_16 ? -1'b0 : id_10;
  wire [id_6 : id_18] id_23;
  module_0 modCall_1 (
      id_7,
      id_15,
      id_14,
      id_8,
      id_2,
      id_19,
      id_14,
      id_19,
      id_14,
      id_16,
      id_12,
      id_15,
      id_15,
      id_3
  );
  logic id_24 = id_4;
endmodule
