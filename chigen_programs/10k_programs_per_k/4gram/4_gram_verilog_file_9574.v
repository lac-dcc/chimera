// Seed: 1160998129
module module_0 (
    input wire id_0,
    input wire id_1,
    input wor id_2,
    input wire id_3,
    input supply1 id_4,
    input tri0 id_5
    , id_8,
    input tri1 id_6
);
  always @(id_4) id_8 = 1'b0;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd85,
    parameter id_1 = 32'd89,
    parameter id_7 = 32'd73
) (
    input supply0 _id_0,
    input tri0 _id_1,
    input supply0 id_2,
    output wor id_3,
    input wor id_4
);
  logic [7:0][1 : id_1] id_6;
  assign id_6[-1] = id_6[id_0];
  specify
    (posedge _id_7 => (id_8 +: id_4)) = (id_1, id_6);
  endspecify
  assign id_8[1+1] = 1;
  logic [7:0] id_9;
  always @(posedge id_6) begin : LABEL_0
    id_9[id_7 : id_7] <= id_7;
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4
  );
  parameter id_10 = 1;
  parameter id_11 = id_10;
  assign id_8 = id_10[1'd0];
  wire id_12;
  wire id_13 = id_1;
endmodule
