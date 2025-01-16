// Seed: 2659956387
module module_0;
  bit id_1 = id_1;
  assign id_2 = 1 ? id_2 : id_1;
  assign id_1 = -1;
  wor id_3, id_4;
  parameter id_5 = id_4;
  id_6 :
  assert property (@(posedge id_2) -1) id_1 <= id_2;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  logic id_2,
    output logic id_3
);
  always begin : LABEL_0
    id_3 = id_1;
    begin : LABEL_0
      @(posedge 1) id_0 = id_2;
    end
    begin : LABEL_0
      begin : LABEL_0
        id_0 <= 1;
      end
    end
    @(posedge id_2 or posedge 1 or posedge -1 or posedge 1) $display(id_1, id_2);
    id_0 <= -1;
  end
  wire id_5;
  module_0 modCall_1 ();
endmodule
