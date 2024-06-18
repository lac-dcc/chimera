// This program was cloned from: https://github.com/kiwih/qtcore-C1
// License: Apache License 2.0

module Control_Status_Registers #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire [2:0] addr,
    input wire [WIDTH-1:0] data_in,
    input wire wr_enable,
    input wire [WIDTH-1:0] IO_IN,
    input wire [WIDTH-1:0] SIG_IN,  // New input signal SIG_IN
    input wire processor_enable,
    input wire scan_enable,
    input wire scan_in,
    output wire [WIDTH-1:0] data_out,
    output wire [WIDTH-1:0] SEGEXE_L_OUT,
    output wire [WIDTH-1:0] SEGEXE_H_OUT,
    output wire [WIDTH-1:0] IO_OUT,
    output wire [5:0] SIG_OUT,  // New output signal SIG_OUT
    output wire INT_OUT,
    output wire scan_out
);

  wire [WIDTH-1:0] segexe_l_data;
  wire [WIDTH-1:0] segexe_h_data;
  wire [WIDTH-1:0] io_in_data;
  wire [WIDTH-1:0] io_out_data;
  wire [WIDTH-1:0] cnt_l_data;
  wire [WIDTH-1:0] cnt_h_data;
  wire [WIDTH-1:0] status_ctrl_data;
  wire [WIDTH-1:0] temp_data;

  wire segexe_l_scan_out;
  wire segexe_h_scan_out;
  wire io_in_scan_out;
  wire io_out_scan_out;
  wire cnt_l_scan_out;
  wire cnt_h_scan_out;
  wire status_ctrl_scan_out;
  wire temp_scan_out;

  shift_register #(.WIDTH(WIDTH)) segexe_l_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b000)),
    .data_in(data_in),
    .data_out(segexe_l_data),
    .scan_enable(scan_enable),
    .scan_in(scan_in),
    .scan_out(segexe_l_scan_out)
  );

  shift_register #(.WIDTH(WIDTH)) segexe_h_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b001)),
    .data_in(data_in),
    .data_out(segexe_h_data),
    .scan_enable(scan_enable),
    .scan_in(segexe_l_scan_out),
    .scan_out(segexe_h_scan_out)
  );

  shift_register #(.WIDTH(WIDTH)) io_in_reg (
    .clk(clk),
    .rst(rst),
    .enable(processor_enable),  // Enable controlled by processor_enable
    .data_in(IO_IN),  // Data input is IO_IN
    .data_out(io_in_data),
    .scan_enable(scan_enable),
    .scan_in(segexe_h_scan_out),
    .scan_out(io_in_scan_out)
  );

  shift_register #(.WIDTH(WIDTH)) io_out_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b011)),
    .data_in(data_in),
    .data_out(io_out_data),
    .scan_enable(scan_enable),
    .scan_in(io_in_scan_out),
    .scan_out(io_out_scan_out)
  );

reg cnt_toggle = 0;

always @(posedge clk or posedge rst)
begin
    if(rst)
        cnt_toggle <= 0;
    else
        cnt_toggle <= ~cnt_toggle;
end

wire cnt_update_enable;
wire [15:0] cnt_update = {cnt_h_data, cnt_l_data} + 1'b1;
wire cnt_enable = cnt_update_enable & cnt_toggle & processor_enable;

shift_register #(.WIDTH(WIDTH)) cnt_l_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b100) | cnt_enable),
    .data_in(wr_enable ? data_in : cnt_update[7:0]),
    .data_out(cnt_l_data),
    .scan_enable(scan_enable),
    .scan_in(io_out_scan_out),
    .scan_out(cnt_l_scan_out)
  );

shift_register #(.WIDTH(WIDTH)) cnt_h_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b101) | cnt_enable),
    .data_in(wr_enable ? data_in : cnt_update[15:8]),
    .data_out(cnt_h_data),
    .scan_enable(scan_enable),
    .scan_in(cnt_l_scan_out),
    .scan_out(cnt_h_scan_out)
  );


  shift_register #(.WIDTH(WIDTH)) status_ctrl_reg (
    .clk(clk),
    .rst(rst),
    .enable(wr_enable & (addr == 3'b110)),
    .data_in(data_in),
    .data_out(status_ctrl_data),
    .scan_enable(scan_enable),
    .scan_in(cnt_h_scan_out),
    .scan_out(status_ctrl_scan_out)
  );

  shift_register #(.WIDTH(WIDTH)) sig_in_reg (
    .clk(clk),
    .rst(rst),
    .enable(processor_enable),  // Enable controlled by processor_enable
    .data_in(SIG_IN),  // Data input is SIG_IN
    .data_out(temp_data),
    .scan_enable(scan_enable),
    .scan_in(status_ctrl_scan_out),
    .scan_out(scan_out)
  );

  assign data_out = (addr == 3'b000) ? segexe_l_data :
                    (addr == 3'b001) ? segexe_h_data :
                    (addr == 3'b010) ? io_in_data :
                    (addr == 3'b011) ? io_out_data :
                    (addr == 3'b100) ? cnt_l_data :
                    (addr == 3'b101) ? cnt_h_data :
                    (addr == 3'b110) ? status_ctrl_data :
                                      temp_data;

  assign SEGEXE_L_OUT = segexe_l_data;
  assign SEGEXE_H_OUT = segexe_h_data;
  assign IO_OUT = io_out_data;
  assign INT_OUT = status_ctrl_data[0];  // INT_OUT is the bottom bit of status_ctrl_data

  assign cnt_update_enable = status_ctrl_data[1];
  assign SIG_OUT = status_ctrl_data[WIDTH-1:WIDTH-6];  // SIG_OUT is the top 6 bits of status_ctrl_data

endmodule
