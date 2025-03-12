// Seed: 4141745351
module module_0 (
    output logic id_0,
    input wand id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply0 id_5
);
  always @* begin : LABEL_0
    id_0 <= -1;
  end
  assign module_1.id_0 = 0;
  logic id_7;
endmodule
module module_1 (
    input  wor   id_0,
    input  wire  id_1,
    output logic id_2
);
  logic [7:0] id_4;
  assign id_2 = id_0;
  reg  id_5;
  wire id_6;
  assign id_4[""] = 1;
  always_latch @*
    @(*) begin : LABEL_0
      if ((-1) + 1 < 1) begin : LABEL_1
        id_5 <= id_1;
        id_2 <= -1;
      end
    end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign id_2 = id_1 != 1;
endmodule
