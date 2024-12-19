// Seed: 3749859235
module module_0 (
    input uwire id_0
);
  assign id_2 = id_2;
  assign module_1.type_5 = 0;
  id_3(
      id_0
  );
endmodule
module module_1 (
    input  logic id_0,
    input  wire  id_1,
    input  logic id_2,
    input  logic id_3,
    input  wand  id_4,
    input  logic id_5,
    output logic id_6,
    input  logic id_7
);
  assign id_6 = 1;
  id_9 :
  assert property (@(negedge 1) 1) begin : LABEL_0
    begin : LABEL_0
      id_6 <= id_9;
      @(posedge id_7 or posedge 1) #1 id_6 = ~1;
    end
    id_6 <= #1 1'd0;
    id_6 <= id_9;
    id_9 = id_5;
    @(posedge id_2) @(posedge id_9) id_9 = id_3;
  end
  assign id_6 = 1;
  for (id_10 = 1; id_3; id_9 = id_10) begin : LABEL_0
    assign id_6 = id_0;
    wire id_11 = id_11;
    initial id_10 <= 1;
  end
  module_0 modCall_1 (id_4);
endmodule
