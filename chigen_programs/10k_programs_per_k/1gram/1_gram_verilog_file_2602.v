// Seed: 4033681970
module module_0 (
    output uwire id_0,
    input wand id_1,
    output wor id_2,
    output supply1 id_3,
    output supply0 id_4
);
  wire id_6;
  assign id_6 = id_6;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    output logic id_2,
    output wire id_3,
    input tri1 id_4,
    input wire id_5,
    input wand id_6,
    input wor id_7,
    output logic id_8,
    input tri id_9,
    input supply1 id_10,
    output tri1 id_11,
    input wire id_12,
    input tri1 id_13,
    input tri1 id_14
);
  always begin : LABEL_0
    id_1 <= id_14;
    id_8 <= id_4;
    id_2 <= id_10.id_14;
  end
  reg id_16, id_17;
  wire id_18;
  reg [1  <->  1 : 1] id_19;
  logic id_20;
  wire [-1 : -1] id_21;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_0,
      id_11,
      id_3
  );
  always begin : LABEL_1
    begin : LABEL_2
      @(posedge id_16 or id_9 or 1)
      if (1'd0)
        if (1);
        else #1 id_19 <= id_13;
    end
    begin : LABEL_3
      begin : LABEL_4
        id_16 <= 1;
      end
      @(posedge id_20) id_17 <= id_20 == -1;
    end
  end
  assign id_1 = (id_12 & id_9 == id_6);
  logic id_22 = -1 ^ (id_6);
  nor primCall (
      id_3,
      id_9,
      id_20,
      id_4,
      id_12,
      id_18,
      id_17,
      id_6,
      id_5,
      id_10,
      id_7,
      id_13,
      id_21,
      id_14,
      id_19,
      id_16
  );
endmodule
