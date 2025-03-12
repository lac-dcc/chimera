// Seed: 1851390628
module module_0 (
    output wand id_0,
    output wire id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4,
    input tri1 id_5,
    output wire id_6,
    input uwire id_7,
    input wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    output tri id_11,
    output supply1 id_12
);
  logic id_14, id_15, id_16;
  wire id_17 = {id_3};
  wire id_18;
endmodule
module module_1 #(
    parameter id_0  = 32'd37,
    parameter id_11 = 32'd35,
    parameter id_19 = 32'd93
) (
    input tri0 _id_0,
    output wire id_1,
    input wor id_2,
    output wor id_3,
    input tri id_4,
    output wand id_5,
    output wand id_6,
    output logic id_7,
    input uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    input wand _id_11,
    output wand id_12
    , _id_19,
    input supply0 id_13,
    input tri1 id_14,
    output logic id_15,
    input tri0 id_16,
    output supply1 id_17
);
  always_ff id_15 = !(id_2);
  module_0 modCall_1 (
      id_6,
      id_12,
      id_16,
      id_10,
      id_10,
      id_10,
      id_5,
      id_4,
      id_16,
      id_16,
      id_14,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
  parameter id_20 = -1;
  if (1) begin : LABEL_0
    always begin : LABEL_1
      if (1) id_7 <= id_13 + id_8;
      #1 begin : LABEL_2
        {id_16, id_16} <= id_9;
      end
    end
  end
  wire [id_19  &&  id_11 : -1] id_21;
  integer [id_0 : -1] id_22;
  ;
  logic id_23;
  parameter id_24 = ~id_20 + 1;
endmodule
