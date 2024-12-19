// Seed: 2477931881
module module_0 ();
  assign id_1 = 1 < 1;
  module_3 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  assign id_4 = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input wire id_1,
    input supply1 id_2
);
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  task id_4;
    reg id_5;
    reg id_6;
    begin : LABEL_0
      do begin : LABEL_0
        id_4 = id_2;
        #1 $display;
        fork
          id_5 <= id_6;
          id_6 <= 1;
        join_none
        id_6 <= 1'b0;
      end while (id_1);
    end
  endtask
  wire id_7;
  wire id_8;
  wire id_9, id_10;
endmodule
