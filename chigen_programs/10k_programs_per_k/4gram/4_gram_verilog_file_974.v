// Seed: 1342787775
module module_0 (
    id_1,
    module_0,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_1;
  supply1 id_7 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_7,
      id_3,
      id_7,
      id_1
  );
  wire id_8;
  always_ff @(posedge id_1) begin : LABEL_0
    #1;
    do begin : LABEL_0$display
      ;
    end while (id_2);
  end
endmodule
