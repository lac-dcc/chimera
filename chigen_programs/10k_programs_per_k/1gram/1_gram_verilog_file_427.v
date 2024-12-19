// Seed: 4253443690
module module_0;
  reg id_1, id_2;
  reg id_3;
  always
    while (id_1) begin : LABEL_0
      id_3 <= 1;
      @(1 or posedge id_2) begin : LABEL_0
        #1 begin : LABEL_0
          begin : LABEL_0
            id_2 <= !id_3;
          end
        end
      end
    end
  wire id_4;
  always id_3 = id_2;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1
    , id_20,
    input tri1 id_2,
    input wand id_3,
    output tri0 id_4,
    output wand id_5,
    input tri id_6
    , id_21,
    input supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    output tri id_10,
    input wire id_11,
    output uwire id_12,
    input wand id_13,
    input wand id_14,
    output tri0 id_15,
    output tri0 id_16,
    output wire id_17,
    input uwire id_18
);
  assign id_15 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
