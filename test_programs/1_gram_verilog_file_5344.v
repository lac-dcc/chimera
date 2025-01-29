// Seed: 4216865927
module module_0 ();
  always_latch begin : LABEL_0
    id_1 <= -1;
    begin : LABEL_0
      begin : LABEL_0
        #id_2 id_1 <= id_2;
        $display({-1'h0, 1, id_2, -1, 1, (id_2) == 1, id_1 - id_2, -1 != -1'b0, -1, -1, id_1, id_2,
                  1}, id_2);
      end
    end
    fork
      @(posedge id_1) begin : LABEL_0
        id_1 = id_1;
        id_1 <= id_1;
      end
      id_1 <= 1;
      id_1 = id_1;
    join_none
    @(posedge id_1 or -1) $display();
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_10;
  module_0 modCall_1 ();
  assign id_1 = 1'h0;
endmodule
