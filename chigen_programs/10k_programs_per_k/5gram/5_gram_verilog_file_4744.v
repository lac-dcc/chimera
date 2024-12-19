// Seed: 3897567848
module module_0;
  wire id_1;
  wire id_3 = id_1;
  always @(negedge 1) begin : LABEL_0
    id_2 <= 1 ==? id_2;
  end
endmodule
module module_1;
  assign id_1 = id_1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wand id_4,
    input supply0 id_5,
    input wire id_6,
    output wire id_7,
    input supply1 id_8,
    input tri id_9
);
  id_11(
      .id_0((id_4 ^ 1 ^ id_3 ~^ 1'h0)),
      .id_1(1),
      .id_2(id_5),
      .id_3(id_9),
      .id_4(1'h0),
      .id_5(1 < id_2)
  );
  assign module_3.id_6 = 0;
endmodule
module module_3 (
    input logic id_0,
    input logic id_1,
    output tri0 id_2,
    output logic id_3,
    output logic id_4,
    input supply1 id_5,
    input logic id_6,
    output logic id_7,
    output tri1 id_8
);
  always @(posedge 1'h0) begin : LABEL_0
    id_2 = id_7++;
    begin : LABEL_0
      id_7 <= (id_0);
      id_4 <= 1'b0;
    end
    #1;
    id_3 <= id_6;
    id_4 <= id_0;
    id_3 <= id_1;
  end
  or primCall (id_2, id_0, id_6, id_5, id_1);
  module_2 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_8,
      id_8,
      id_5,
      id_5,
      id_8,
      id_5,
      id_5
  );
endmodule
