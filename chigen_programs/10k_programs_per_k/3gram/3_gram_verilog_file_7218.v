// Seed: 3084031194
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri id_3,
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    output tri id_7,
    output wand id_8
);
  id_10(
      .id_0(id_2),
      .id_1(id_5 <= (1)),
      .id_2(1'b0),
      .id_3(id_6),
      .id_4(id_4),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(1'b0)
  );
  wire id_11;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input tri id_2,
    input wand id_3,
    input wor id_4,
    output wire id_5,
    input wire id_6
);
  always @(1 or id_0) begin : LABEL_0
    #1 begin : LABEL_0$display
      ;
    end
  end
  wire id_8;
  xnor primCall (id_5, id_2, id_9, id_4, id_6, id_3);
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_1,
      id_4,
      id_0,
      id_6,
      id_5,
      id_5
  );
endmodule
