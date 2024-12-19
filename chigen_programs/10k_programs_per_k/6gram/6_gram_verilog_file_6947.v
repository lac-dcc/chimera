// Seed: 2575903200
module module_0;
  assign id_1 = 1'b0 ==? id_1;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output logic id_2,
    output logic id_3,
    input  logic id_4,
    output logic id_5
);
  always @* begin : LABEL_0
    id_2 <= id_4;
    begin : LABEL_0
      id_5 <= id_1;
      $display(id_1);
      `define pp_7 0
      id_5 = 1;
      case (1)
        id_1: id_2 <= 1;
        1: `pp_7 <= 1;
        `pp_7: id_5 = id_4;
        id_1 + `pp_7: begin : LABEL_0
          if (1) begin : LABEL_0
            id_5 = 1;
            `pp_7 <= 1;
            $display(id_4 - id_4, `pp_7, `pp_7);
          end else begin : LABEL_0
            id_3 = 1;
            $display(1, id_1 == 1);
            wait (1'd0);
            id_0 <= id_1;
          end
        end
        1'h0: id_5 = 1;
      endcase
      @(posedge 1);
      id_0 <= "";
      if (1) id_2 = 1 == `pp_7;
    end
    if (1'b0 == {{1, !module_1, id_1}, id_4} && 1 << 1'b0 && 1'b0 && 1) begin : LABEL_0
      if (1 !=? id_4) begin : LABEL_0
        if (1)
          case (1 == id_4 + 1'h0)
            id_4 == id_4: id_3 <= 1;
            id_4: id_5 = id_4;
            1: id_3 <= 1;
            id_4: id_2 = id_4;
            id_4: assign id_5 = id_1;
          endcase
      end else begin : LABEL_0
        id_2 <= 1'b0;
      end
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_3 = 1'b0;
endmodule
