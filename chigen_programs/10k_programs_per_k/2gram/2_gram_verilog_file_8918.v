// Seed: 3010620792
module module_0 ();
  assign id_1 = 1;
  reg  id_2 = id_1;
  reg  id_3;
  wire id_4;
  assign id_2 = 1;
  reg id_5 = id_3;
  pullup (id_2, id_1);
  id_6 :
  assert property (@(id_2) 1)
  else;
  final begin : LABEL_0
    @(1)
    #1 begin : LABEL_0
      do begin : LABEL_0
        id_5 <= id_6;
      end while (1);
    end
  end
  reg id_7 = id_1;
  assign module_1.id_2 = 0;
  wire id_8;
  assign id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  assign id_1 = "";
  module_0 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    begin : LABEL_0
      id_2 <= 1;
    end
  end
  wire id_3;
endmodule
