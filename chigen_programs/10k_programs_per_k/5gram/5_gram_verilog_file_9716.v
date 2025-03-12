// Seed: 621726542
module module_0 #(
    parameter id_13 = 32'd94
) (
    output wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 module_0,
    input supply1 id_4,
    input uwire id_5,
    output logic id_6,
    output wire id_7
);
  localparam id_9 = 1;
  wire id_10;
  assign module_1.id_5 = 0;
  assign id_7 = id_4;
  always @(id_4 or 1'b0) id_6 = id_3;
  wire id_11, id_12;
  logic _id_13;
  always @(posedge id_10) id_6 = id_5;
  wire [-1 : 1  /  id_13] id_14;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    output uwire id_2,
    input wand id_3,
    output tri0 id_4,
    output supply0 id_5,
    input tri0 id_6
);
  always @(id_6 or posedge 1) force id_1[-1] = -1;
  initial begin : LABEL_0
    if (-1) begin : LABEL_1
      id_1 <= id_6;
    end
  end
  or primCall (id_0, \id_9 , id_8, id_3, id_6);
  logic [7:0] id_8;
  wire \id_9 ;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3,
      id_6,
      id_3,
      id_3,
      id_1,
      id_0
  );
  assign id_8[-1] = id_6 == 1;
endmodule
