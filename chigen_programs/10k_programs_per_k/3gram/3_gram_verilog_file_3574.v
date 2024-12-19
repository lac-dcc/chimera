// Seed: 4206210937
module module_0 (
    output tri1 id_0,
    input  wire id_1,
    input  wand id_2
);
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1
    , id_8,
    output wire id_2,
    input logic id_3,
    input logic id_4,
    output supply0 id_5,
    output logic id_6
);
  assign #1 id_6 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0
  );
  id_9 :
  assert property (@(negedge 1) id_4 ^ id_0)
  else begin : LABEL_0
    id_9 <= id_3;
  end
  always @(posedge 1 or posedge 1) begin : LABEL_0
    #1 id_6 <= 1 == 1;
  end
  wire id_10;
  id_11(
      .id_0(id_10), .id_1(1'b0), .id_2(id_3)
  );
endmodule
