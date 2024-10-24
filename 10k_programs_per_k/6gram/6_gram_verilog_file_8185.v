// Seed: 1073338228
module module_0 (
    output id_0,
    input logic id_1,
    input id_2,
    input id_3,
    input id_4,
    input id_5,
    input id_6,
    input reg id_7,
    input logic id_8,
    output id_9,
    input id_10,
    input supply0 id_11,
    input tri0 id_12
);
  reg id_13, id_14;
  reg id_15;
  integer id_16, id_17, id_18, id_19, id_20 = 1;
  logic id_21;
  type_39(
      id_5, 1, id_9
  );
  assign id_17 = 1;
  task id_22;
    input id_23;
    integer id_24;
    reg id_25, id_26, id_27, id_28;
    output reg id_29;
    begin
      if (1) begin
        id_20 = id_17;
      end else id_26 <= id_7;
    end
  endtask
  logic id_30;
  always @(negedge id_12[1]) begin
    SystemTFIdentifier;
  end
  assign id_14 = id_30 ? id_15 : id_29;
  assign id_17 = id_6;
  always @(1, id_17 + id_4 or {1,
    id_14,
    1,
    "" - 1
  }, id_29, 1'b0, id_14 or 1 or id_16 or 1'b0, 1, id_11[1] or id_25 or 1, id_8 == id_28,
      id_13 or 1 or 1, posedge id_19 or 1'b0)
  begin
    SystemTFIdentifier;
  end
endmodule
