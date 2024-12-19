// Seed: 1014159023
module module_0;
  task id_1;
    input reg id_2;
    begin : LABEL_0
      id_2 <= 1'h0;
      id_1 = id_2;
      id_1 = 1'b0 & 1;
      if (1)
        if (id_1) begin : LABEL_0
          if (1'b0) begin : LABEL_0
            if (id_2) begin : LABEL_0
              id_2 = id_1;
              id_2 <= 1;
            end
          end
        end else begin : LABEL_0
          id_1 = 1'h0;
        end
      else begin : LABEL_0
        id_1 <= id_1;
        if (id_2) begin : LABEL_0
          begin : LABEL_0
          end
        end
      end
    end
  endtask
  always @(~id_2) id_2 = id_1;
  assign module_1.id_5 = 0;
  wire id_3;
  tri0 id_4;
  wire id_5;
  wire id_6;
  tri  id_7;
  wire id_8;
  id_9 :
  assert property (@(posedge id_7 - 1) 1)
  else $display(1 - id_4, 1, 1);
  wire id_10;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri1  id_1,
    input  wire  id_2,
    output tri   id_3,
    output tri0  id_4,
    input  tri   id_5,
    output uwire id_6
);
  wire id_8;
  assign id_3 = 1;
  assign id_1 = id_2;
  module_0 modCall_1 ();
endmodule
