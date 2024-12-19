// Seed: 1771876385
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2
);
  wand  id_4;
  uwire id_5;
  assign id_4 = 1;
  final begin : LABEL_0$display
    ;
  end
  assign id_4 = ~1;
  assign id_5 = 1;
  assign id_4 = id_5;
  supply0 id_6;
  initial begin : LABEL_0
    id_6 = (1);
  end
  wire id_7;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  wand  id_2
);
  reg id_4, id_5, id_6;
  always @(posedge 1 - 1) begin : LABEL_0
    #1 begin : LABEL_0
      if (1) begin : LABEL_0
        wait (id_5);
      end else id_5 = 1;
      id_0 <= 1'b0;
      id_5 <= 1;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
