// Seed: 3556239718
module module_0 (
    input wire id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wire id_4,
    input uwire id_5,
    output wor id_6,
    output wand id_7,
    input wor id_8,
    input supply1 id_9,
    output tri0 id_10,
    output wire id_11,
    output uwire id_12,
    input uwire id_13,
    input wor id_14
);
  parameter id_16 = 1;
  wire id_17;
  logic id_18 = 1, id_19;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input wire id_2,
    output logic id_3,
    input supply1 id_4,
    input tri0 id_5,
    output logic id_6,
    input tri id_7
);
  logic id_9;
  xnor primCall (id_3, id_1, id_7, id_2, id_9, id_5, id_4);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_1,
      id_5,
      id_5,
      id_0,
      id_0,
      id_7,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_14 = 0;
  assign id_9 = 1;
  bit id_10 = 1;
  initial begin : LABEL_0
    begin : LABEL_1
      #1 id_6 <= -1;
      if (-1) disable id_11;
      else begin : LABEL_2
        if (-1'b0) begin : LABEL_3
          id_9 = #id_12(-1);
        end
      end
    end
    id_10 <= id_2 << 1;
    id_9  <= id_2;
    id_3  <= -1;
    $clog2(93);
    ;
  end
endmodule
