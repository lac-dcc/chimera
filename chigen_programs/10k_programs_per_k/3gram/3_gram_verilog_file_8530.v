// Seed: 275387280
module module_0;
  reg id_2;
  always
    for (type_10 id_3 = id_1; 1; id_1 = 1'b0) begin : LABEL_0
      #1 begin : LABEL_0
        begin : LABEL_0
          fork
            #1 begin : LABEL_0
              id_1 <= 1;
            end
          join
        end
      end
      id_2 <= id_1;
      id_2 <= (id_3);
      id_4(id_3);
      id_1 = #id_5 id_1;
      id_4 = 1'b0;
      id_6(1);
      id_3 = id_4;
      id_6 <= (id_4);
      id_5 <= {1{1}};
      #1 begin : LABEL_0
        if (id_3) begin : LABEL_0
          id_3 <= id_2 - id_4;
        end
        force id_1 = 1 == 1'd0;
      end
    end
  reg id_7;
  assign id_2 = id_7;
  wire id_8;
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
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri0 id_10 = 1;
  module_0 modCall_1 ();
endmodule
