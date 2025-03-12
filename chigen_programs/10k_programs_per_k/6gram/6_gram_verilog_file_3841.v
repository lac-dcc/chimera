// Seed: 3402760757
module module_0 (
    input wire id_0,
    input wand id_1,
    output tri id_2,
    input wor id_3,
    output supply0 id_4
);
  logic id_6;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd25,
    parameter id_3  = 32'd41,
    parameter id_7  = 32'd31
) (
    output uwire id_0,
    output uwire id_1,
    input tri1 id_2,
    input wire _id_3,
    input tri0 id_4,
    input wand id_5,
    output supply0 id_6,
    input tri0 _id_7,
    output tri id_8
);
  assign id_0 = 1'b0;
  parameter id_10 = 1;
  reg [id_3  /  id_7 : 1 'd0] id_11;
  wire _id_12;
  ;
  assign id_11 = 1 - id_12;
  initial id_11 <= 1;
  logic [id_3 : id_7] id_13;
  ;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_5,
      id_8
  );
  parameter id_14 = 1;
  initial begin : LABEL_0
    if (id_10 || id_10[id_12 : 1'b0<=~$realtime] || 1'b0) disable id_15;
    else if (id_10[1] && id_14) id_13 <= id_4;
  end
endmodule
