// Seed: 1572086132
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output supply1 id_3,
    output tri id_4,
    input supply0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    output supply0 id_8,
    input wand id_9,
    input tri1 id_10,
    input supply1 id_11,
    output wand id_12
);
  assign id_12 = id_1 == 1;
  assign module_1.id_11 = 0;
  wire id_14;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    input wand id_2,
    output logic id_3,
    input wand id_4,
    input wand id_5,
    output wire id_6,
    output wand id_7,
    input wand id_8,
    input tri id_9,
    input tri id_10
    , id_21,
    input supply0 id_11,
    input wor id_12,
    input tri id_13,
    input wor id_14,
    input uwire id_15,
    output wire id_16,
    input tri id_17,
    input tri id_18,
    input tri0 id_19
);
  id_22 :
  assert property (@(id_15) id_10)
  else begin : LABEL_0
    id_7 = id_13;
    begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          @(negedge id_21) $display(id_2);
          $display(id_12);
        end
      end
    end
    if (id_11) id_0 = id_18;
    else id_3 <= 1;
    @(posedge 1'h0) id_7 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_1,
      id_1,
      id_0,
      id_19,
      id_4,
      id_16,
      id_7,
      id_13,
      id_9,
      id_8,
      id_22
  );
endmodule
