// Seed: 3366653203
module module_0 (
    input tri id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri id_3
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    output tri  id_1,
    input  tri1 id_2
);
  supply1 id_4, id_5;
  always
  fork
    if (1) $display(id_2, id_0, id_2, id_5);
  join
  wire id_6;
  tri1 id_7 = id_5 & id_5, id_8, id_9;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always cover (id_3) @(id_3, negedge id_1) #id_5 id_2 <= 1;
  wire id_6;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  initial if (1) id_2 <= #1 id_4;
  module_2 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_5
  );
  wor id_6;
  for (id_7 = 1; id_4; id_4 = 1'h0) begin : LABEL_0
    always #1 id_7 <= #1  !id_7;
    begin : LABEL_0
      wire id_8;
    end
  end
  initial begin : LABEL_0
    #(1) begin : LABEL_0
      id_2 <= 1;
      begin : LABEL_0
        id_6 = 1 != 1;
      end
    end
  end
  always $display(id_7, 1'b0, !id_7);
  wire id_9, id_10, id_11, id_12, id_13;
endmodule
