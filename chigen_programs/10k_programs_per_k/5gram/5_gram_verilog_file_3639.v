// Seed: 1584097733
module module_0 (
    output uwire id_0,
    input wire id_1,
    input wor id_2,
    input supply1 id_3,
    output wand id_4
);
  assign id_0 = id_2;
  assign id_4 = 1 < 'd0;
  id_6(
      .id_0(1), .id_1(id_0), .id_2(), .id_3(id_4), .id_4(id_2)
  );
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wand id_5,
    input wand id_6,
    input wire id_7,
    input wand id_8,
    output tri0 id_9
);
  reg id_11 = id_8 >= 'b0;
  always @(1'b0 ~^ id_11 or posedge id_1 == 1) begin : LABEL_0
    if (1'b0 == id_11) id_11 <= 1 ^ id_8;
    else deassign id_4;
  end
  reg id_12;
  assign (pull1, strong0) id_11 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_8,
      id_8,
      id_9
  );
  always @(negedge id_8) begin : LABEL_0
    id_12 <= 1;
  end
endmodule
