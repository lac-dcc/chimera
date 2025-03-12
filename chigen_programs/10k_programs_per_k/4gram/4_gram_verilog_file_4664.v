// Seed: 3419968153
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input tri1 id_2
);
  wire id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd7,
    parameter id_9 = 32'd96
) (
    input wor id_0,
    output tri0 id_1,
    input tri1 id_2,
    input tri0 _id_3,
    input supply1 id_4
    , id_15, id_16,
    output tri0 id_5,
    output wor id_6,
    output wor id_7,
    input wire id_8,
    input tri _id_9,
    input tri id_10,
    output logic id_11,
    output logic id_12,
    input wor id_13
);
  assign id_7 = id_4 * id_16;
  parameter id_17 = $unsigned(75);
  ;
  reg id_18;
  ;
  assign id_18 = -1;
  task id_19;
    begin : LABEL_0
      begin : LABEL_1
        assume (1'b0);
      end
      id_11 <= 1;
      id_18 <= 1;
      if ("") id_12 <= ~id_4;
      else begin : LABEL_2
        if (id_17 & id_17 & 1'b0 && id_17#(id_17 == 1, -1) && "") begin : LABEL_3
          id_15 <= 1;
        end
      end
      id_16 <= -1;
      id_19[(1)==id_9 : id_3] = 1;
    end
  endtask
  module_0 modCall_1 (
      id_0,
      id_7,
      id_13
  );
  assign modCall_1.id_1 = 0;
endmodule
