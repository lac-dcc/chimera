// Seed: 3385056553
module module_0 #(
    parameter id_4 = 32'd90
) (
    input supply0 id_0,
    output tri id_1,
    input tri0 id_2
);
  localparam id_4 = 1;
  wire [-1 : id_4] id_5;
  logic id_6;
  always @(-1 or posedge id_2) begin : LABEL_0
    return id_6;
  end
  wire id_7;
  assign id_6 = id_5;
  assign module_1.id_3 = 0;
  wire [1 : id_4] id_8;
  wire id_9;
  assign id_1 = id_7 ? 1 : 1'b0;
endmodule
module module_1 #(
    parameter id_0 = 32'd93
) (
    input uwire _id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    input wand id_4,
    output supply1 id_5
);
  wire [-1 : -1] id_7, id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4
  );
  wire [-1 'h0 ==  id_0 : 1] id_10;
endmodule
