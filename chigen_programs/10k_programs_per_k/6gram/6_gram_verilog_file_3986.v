// Seed: 238056091
module module_0 ();
  bit id_1;
  initial id_1 = #1 -1;
  assign module_2.id_12 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output logic id_4
);
  assign #(id_2) id_4 = id_0;
  localparam id_6 = 1;
  wire id_7;
  always
    while (-1'b0)
      if (-1) begin : LABEL_0
        if (-1) id_4 <= #id_0 -1;
      end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_12 = 32'd93,
    parameter id_20 = 32'd13,
    parameter id_7  = 32'd54
) (
    output wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri id_4,
    input tri0 id_5,
    output uwire id_6,
    input wor _id_7,
    input tri0 id_8,
    input tri id_9
    , id_16,
    output tri0 id_10,
    input wand id_11,
    output uwire _id_12,
    input supply0 id_13,
    output supply1 id_14
);
  assign id_10 = -1'd0;
  logic [7:0][id_12 : -1] id_17;
  wire ["" : id_7] id_18, id_19;
  wire [-1 'b0 : 1] _id_20;
  wire id_21;
  xor primCall (
      id_0,
      id_1,
      id_11,
      id_13,
      id_16,
      id_17,
      id_18,
      id_19,
      id_2,
      id_21,
      id_3,
      id_4,
      id_5,
      id_8,
      id_9
  );
  always @(posedge 1) begin : LABEL_0
    id_17[id_20] = id_5 ? 1 : -1;
  end
  module_0 modCall_1 ();
  assign id_10 = id_11;
endmodule
