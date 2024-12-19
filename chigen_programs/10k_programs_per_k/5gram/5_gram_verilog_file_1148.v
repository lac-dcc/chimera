// Seed: 3934392438
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input wor id_2,
    output supply0 id_3
    , id_12,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6
    , id_13,
    output tri1 id_7,
    output tri id_8,
    output wand id_9,
    output supply1 id_10
);
  wire id_14, id_15, id_16, id_17;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    input  wire  id_2,
    input  wire  id_3
);
  not primCall (id_0, id_2);
  always_ff @(*) begin : LABEL_0
    if (1 != id_2)
      if (id_3 == 1'b0) disable id_5;
      else $display(id_2, 1'b0, 1, id_2 == id_2, id_1);
    else if (1) begin : LABEL_0
      id_0 = #1 1;
    end
  end
  id_6 :
  assert property (@(posedge id_1) id_6 - id_3)
  else $display;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_6,
      id_2,
      id_3,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6
  );
  id_7(
      .id_0(1 < id_2), .id_1(), .id_2(1 == 1)
  );
endmodule
