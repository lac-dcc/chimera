// Seed: 137779370
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    output wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wire id_5,
    output wor id_6,
    input wire id_7,
    input supply1 id_8,
    output uwire id_9,
    input supply1 id_10,
    input wand id_11,
    input tri1 id_12,
    input uwire id_13,
    input wire id_14,
    output uwire id_15
);
  always begin : LABEL_0
    $clog2(56);
    ;
    if (1) assert (1);
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd52
) (
    input tri id_0,
    input supply1 _id_1,
    input tri0 id_2,
    output uwire id_3
);
  localparam id_5 = 1'd0;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_3
  );
  wor [!  id_1 : -1] id_6;
  wire id_7;
  assign id_6 = ~|id_6 ? (1) : id_1;
endmodule
