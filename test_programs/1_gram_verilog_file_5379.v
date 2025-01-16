// Seed: 186639563
module module_0 (
    output logic id_0,
    input  wand  id_1,
    id_4,
    input  tri0  id_2
);
  initial id_0 <= #1 -1;
  assign module_1.type_2 = 0;
  id_5(
      .id_0(id_2),
      .id_1(id_4),
      .id_2(id_0),
      .id_3(id_2),
      .id_4(1),
      .id_5(1),
      .id_6(id_2 + 1),
      .id_7(id_1 - id_4),
      .id_8(id_1)
  );
  if (id_2 + id_4) begin : LABEL_0
    string id_6 = "", id_7;
    wire id_8;
  end
  localparam id_9 = id_9;
endmodule
module module_1 (
    input wire  id_0,
    id_4,
    input logic id_1,
    input logic id_2
);
  assign id_5 = -1;
  id_6 :
  assert property (@(posedge id_2 - id_1 !== id_2) id_4) begin : LABEL_0
    id_4 <= id_1;
  end
  function id_7;
    input id_8;
    id_6 = id_2;
  endfunction
  module_0 modCall_1 (
      id_6,
      id_0,
      id_0
  );
  assign id_7 = -1 - id_0;
endmodule
