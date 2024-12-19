// Seed: 1723402184
module module_0;
  wire id_1;
  wire id_2;
endmodule
module module_1 ();
  wire id_1, id_2;
  module_0 modCall_1 ();
  always_ff id_1 += id_2;
  always
    if (1)
      `define pp_3 0
endmodule
module module_2 (
    input logic id_0,
    output logic id_1,
    input tri1 id_2,
    output uwire id_3,
    output logic id_4,
    input supply0 id_5,
    input logic id_6,
    input wire id_7,
    output wand id_8,
    input logic id_9,
    input supply0 id_10,
    input logic id_11,
    output supply1 id_12,
    input uwire id_13,
    input wand id_14,
    input logic id_15,
    output logic id_16,
    input tri0 id_17,
    input wor id_18,
    input tri0 id_19,
    input uwire id_20,
    output tri0 id_21,
    input wand id_22,
    input tri id_23,
    input tri0 id_24,
    input wire id_25,
    output supply0 id_26,
    input uwire id_27
);
  wand id_29 = 1;
  assign {1} = id_20;
  nmos (id_5, id_0 * 1, 1, 1 == 1, id_15 & id_12, id_14, 1);
  logic id_30 = id_0, id_31 = 1;
  logic id_32 = id_15;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    id_4 = 1;
    begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          if (id_25) id_1 <= 1;
          $display;
          begin : LABEL_0
            #1 return id_11;
            if (1) id_12 = 1;
            else wait (id_29);
            #1 id_16 = id_9;
          end
          @(posedge id_30) begin : LABEL_0
            begin : LABEL_0
              id_4 <= id_6;
            end
          end
          id_4 <= 1;
        end
      end
      #1;
      id_16 <= 1 && id_31;
      id_32 <= id_31;
    end
  end
  wire id_33;
endmodule
