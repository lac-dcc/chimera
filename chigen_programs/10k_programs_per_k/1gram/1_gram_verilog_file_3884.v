// Seed: 3975922510
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input wire id_5,
    input supply1 id_6
);
  wire id_8, id_9;
  assign module_1.type_0 = 0;
  wire id_10, id_11;
  wire id_12;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input supply1 id_2,
    output logic id_3,
    input tri id_4,
    input logic id_5,
    output logic id_6,
    input logic id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    input wor id_11,
    input tri0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input wire id_15,
    input supply0 id_16,
    input supply1 id_17
);
  initial begin : LABEL_0
    begin : LABEL_0
      id_1 <= 1;
      begin : LABEL_0
        id_3 <= 1;
        id_6 = id_7;
      end
      id_6 <= id_15 + 1;
      begin : LABEL_0
        begin : LABEL_0
          id_6 = 1;
        end
        id_1 = 1;
        @(posedge 1) $display();
        @* id_3 <= id_5;
      end
    end
  end
  module_0 modCall_1 (
      id_0,
      id_16,
      id_17,
      id_2,
      id_2,
      id_13,
      id_4
  );
  wire id_19, id_20;
  wire id_21, id_22;
endmodule
