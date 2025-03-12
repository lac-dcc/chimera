// Seed: 1454923273
module module_0 (
    output logic   id_0,
    input  supply1 id_1,
    input  supply0 id_2
);
  always @(posedge 1) begin : LABEL_0
    $signed(70);
    ;
    id_0 = 1;
  end
  logic [-1 : -1] id_4;
  ;
  assign id_4 = id_4;
  assign id_0 = 1 - ~id_4;
  logic [-1 : (  -1 'd0 )] id_5, id_6;
  wire id_7;
  localparam id_8 = 1 + 1;
  always disable id_9;
  assign id_9 = id_7;
  assign module_1.id_1 = 0;
  wire id_10;
  always @(posedge id_10 == 1'b0)
    casez (id_5)
      -1: id_5 = -1'h0;
      ~1: id_6 <= id_10;
      "" == id_10: id_0 <= id_10 != 1 - (1'd0 == -1);
      id_1: begin : LABEL_1
        id_4 <= 1'b0;
        id_6 <= 'b0;
      end
    endcase
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    input  tri1  id_2,
    output logic id_3
);
  always @(posedge id_0) begin : LABEL_0
    if (1) begin : LABEL_1
      if (1) id_3 <= id_2;
      else begin : LABEL_2
        id_1 <= 1;
      end
    end
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0
  );
  logic [7:0] id_5;
  assign id_3 = -1'h0;
  wire id_6;
  assign id_3 = id_0;
  assign id_5[-1] = "";
  logic id_7;
endmodule
