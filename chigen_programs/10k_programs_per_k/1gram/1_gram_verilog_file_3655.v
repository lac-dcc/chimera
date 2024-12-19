// Seed: 3163570999
module module_0 (
    input tri id_0,
    output wor id_1,
    input wand id_2,
    input supply1 id_3,
    input supply1 id_4
);
  wire id_6, id_7, id_8;
  always id_8 = 1 - (1);
  reg id_9;
  id_10(
      (id_3), 1, id_4, 1, id_1, 1'b0, 'b0
  );
  final
    #1 begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          begin : LABEL_0
            id_6 = id_8;
          end
          if (id_9) id_7 = id_7;
        end
      end
    end
  assign module_1.id_5 = 0;
  id_11 :
  assert property (@* id_10) id_9 <= #1 1;
  assign id_1 = 1;
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    output wire  id_2,
    input  tri1  id_3,
    output tri0  id_4,
    input  wire  id_5,
    output tri   id_6,
    input  wire  id_7,
    input  uwire id_8
);
  wor id_10 = id_7, id_11, id_12;
  assign id_11 = id_7;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_5,
      id_8,
      id_8
  );
  wire id_15;
  id_16(
      1'h0
  );
  wire id_17;
endmodule
