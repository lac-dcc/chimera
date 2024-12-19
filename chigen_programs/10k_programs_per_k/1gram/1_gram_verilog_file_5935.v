// Seed: 2401464849
module module_0 (
    input wor id_0
);
  reg id_2, id_3, id_4;
  id_5(
      1 * 1'b0, 1
  );
  always begin : LABEL_0
    id_3 <= id_2;
  end
  assign id_4 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  logic id_2,
    input  wor   id_3,
    output logic id_4,
    input  logic id_5,
    output logic id_6,
    output logic id_7,
    input  logic id_8
);
  assign id_4 = id_5;
  wire id_10;
  logic id_11, id_12, id_13, id_14, id_15;
  always
  fork
    id_1 = id_12;
    id_7  <= 1;
    id_11 <= id_8;
    begin : LABEL_0
      id_14 = 1 + 1 * id_0;
      begin : LABEL_0
        id_7 <= id_8;
      end
      begin : LABEL_0
        id_7 <= id_5;
      end
      begin : LABEL_0
        id_6 <= 1;
      end
    end
    begin : LABEL_0
      id_6 <= id_2;
      id_15 = (1);
    end
    @(negedge id_3 or posedge 1) id_1 <= id_11;
    id_6 = #(1) 1 - id_11;
  join
  module_0 modCall_1 (id_0);
  generate
    wire id_16;
    begin : LABEL_0
      wire id_17;
    end
  endgenerate
endmodule
