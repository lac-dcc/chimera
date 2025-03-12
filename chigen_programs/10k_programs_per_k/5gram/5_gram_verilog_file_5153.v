// Seed: 1262742961
module module_0;
  logic id_1;
  assign module_1.id_2 = 0;
  wire id_2 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd89,
    parameter id_2 = 32'd40,
    parameter id_3 = 32'd8,
    parameter id_7 = 32'd23
) (
    _id_1,
    _id_2
);
  output wire _id_2;
  output wire _id_1;
  wire _id_3;
  task id_4();
    union packed {
      logic [id_1 : -1  -  id_2] id_5;
      logic [id_3 : -1] id_6;
    } _id_7;
    begin : LABEL_0
      if (1) begin : LABEL_1
        wait (id_7.id_5[{id_7, 1, id_7}]);
      end
    end
  endtask
  module_0 modCall_1 ();
  struct packed {
    struct packed {
      logic id_8;
      logic [1 'b0 : id_1] id_9;
    } [-1 : 1] id_10;
  } id_11 = 1;
endmodule
