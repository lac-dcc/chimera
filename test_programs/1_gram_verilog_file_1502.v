// Seed: 3910658056
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri   id_2,
    input  wor   id_3,
    output uwire id_4
);
  wire id_6, id_7;
  wire id_8;
  module_2 modCall_1 ();
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_1
  );
endmodule
module module_2 ();
  initial @(negedge id_1) id_2 = -1 + 'b0;
  reg id_3 = id_2;
  wire id_4, id_5;
  assign id_3 = 1;
  always @(posedge -1)
    if (-1'b0) begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          begin : LABEL_0
            id_2 <= -1;
          end
        end
      end
      id_3 <= 1;
    end
endmodule
