// Seed: 2513196986
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wand id_7,
    output wire id_8,
    output logic id_9,
    input supply0 id_10,
    output uwire id_11
);
  assign id_8 = id_2;
  always_latch id_9 <= -1;
  assign module_1.id_5 = 0;
  assign id_3 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    output logic id_2,
    input  uwire id_3,
    output logic id_4,
    input  tri   id_5,
    input  logic id_6,
    input  tri0  id_7,
    input  wand  id_8
);
  assign id_4 = id_6;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_7,
      id_1,
      id_8,
      id_5,
      id_0,
      id_5,
      id_1,
      id_2,
      id_7,
      id_1
  );
  always begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        id_2 <= ~-1;
        id_4 <= (1);
        @(*) begin : LABEL_0
          begin : LABEL_0
            #1 return id_10;
          end
        end
      end
      id_4 = id_8 !=? id_10;
    end : SymbolIdentifier
  end
  always_ff id_4 <= 1 - id_5;
endmodule
