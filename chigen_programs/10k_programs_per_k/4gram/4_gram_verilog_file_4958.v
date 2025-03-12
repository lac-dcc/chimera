// Seed: 1395063069
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd90,
    parameter id_5 = 32'd92,
    parameter id_8 = 32'd91
) (
    input supply1 id_0,
    output tri0 id_1,
    output logic id_2,
    input wand id_3,
    input wor _id_4,
    input tri0 _id_5
);
  logic [7:0] id_7;
  assign id_1 = id_1++;
  wire [id_5 : 1] _id_8;
  parameter id_9 = -1;
  assign id_7[-1'd0] = 1;
  always @(1'd0 or posedge id_5) begin : LABEL_0
    id_2 <= #1 1;
  end
  wire id_10;
  module_0 modCall_1 (
      id_9,
      id_10
  );
  wire [id_4 : id_8] id_11;
  and primCall (id_1, id_10, id_3, id_0, id_9);
endmodule
