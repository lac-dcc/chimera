// Seed: 3729954859
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2,
    output uwire id_3,
    input tri id_4,
    output wand id_5
);
  wire id_7;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_7 = 32'd62
) (
    input tri1 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output wand id_3,
    input uwire id_4,
    output tri1 id_5,
    output tri1 id_6,
    input tri1 _id_7,
    input wire id_8,
    output uwire id_9,
    input wor id_10,
    output logic id_11,
    output wire id_12,
    input wand id_13
    , id_16,
    output tri id_14
);
  localparam id_17 = 1'd0;
  assign id_16[id_7&-1] = -1;
  wire id_18;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_13,
      id_12,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
  wire id_19;
  always @(posedge id_0 == -1 or id_14++
  >= id_8)
  begin : LABEL_0
    id_11 <= id_0;
  end
endmodule
